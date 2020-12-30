// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/bloc/location/location_bloc.dart';
import 'package:fluttertaladsod/application/core/components/dialogs.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/image/i_image_repository.dart';
import 'package:fluttertaladsod/domain/image/image_failure.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import '../store_primitive.dart';

class StoreFormBloc extends GetxController with SimepleProgressSetter {
  IImageRepository get _iImageRepository => Get.find();
  IStoreRepository get _iStoreRepository => Get.find();
  IAuthFacade get _iAuthFacade => Get.find();
  LocationBloc get _locationBloc => Get.find();

  StorePrimitive _storePrim = StorePrimitive.created(ownerId: '');
  StorePrimitive get store => _storePrim;
  void updateStore(StorePrimitive store) {
    _storePrim = store;
    update();
  }

  bool _isCreating = false;

  Future<void> initializeForm({
    @required Option<Store> initialStore,
  }) async {
    updateWithLoading();
    final location = _locationBloc.location;
    initialStore.fold(
      () {
        _storePrim = store.copyWith(
            location: StoreLocation.fromLocationDomain(location));
        updateWithLoaded();
      },
      (initStore) async {
        _isCreating = true;
        _storePrim = StorePrimitive.fromDomain(initStore);
        updateWithLoaded();
      },
    );
  }

  void nameChanged(String newName) {
    updateStore(store.copyWith(name: newName));
  }

  void menuChanged(String newMenu) {
    updateStore(store.copyWith(menu: newMenu));
  }

  Future<void> bannerChangeRequested() async {
    final imageOption = await _iImageRepository.getImage();
    imageOption.fold(
        () => null, (img) => updateStore(store.copyWith(banner: left(img))));
  }

  Future<void> picsSelectionRequested() async {
    const bool isPremium = true;
    if (!isPremium) {
      Get.toNamed(Routes.upgradeSplash);
      return;
    }
    final imageOption = await _iImageRepository.getImage();
    imageOption.fold(
      () => null,
      (img) {
        updateStore(
            store.copyWith(pics: List.from(store.pics)..add(left(img))));
      },
    );
  }

  Future<void> zoomImage(int index) async {
    print('zooming');
  }

  Future<void> picDeleteRequested(int picIndex) async {
    updateStore(store.copyWith(pics: store.pics..removeAt(picIndex)));
  }

  Future<void> saved() async {
    Either<dynamic, Unit> failureOrSuccess;
    // send the latest store to firestore (either update or create is checked by [isEditting])
    final uploadingStore = store.toDomain();
    if (uploadingStore.isValid) {
      savingDialog(Get.context).show();
      final userOption = await _iAuthFacade.getSignedInUser();
      final user = userOption.getOrElse(() => throw 'user not authenticated');
      updateStore(store.copyWith(ownerId: user.id.getOrCrash()));

      await Future.wait([
        _uploadBannerPic(),
        _uploadStorePics(),
      ]).then((fOrSuccessList) {
        failureOrSuccess = fOrSuccessList[0].flatMap((_) => fOrSuccessList[1]);
      });

      await failureOrSuccess.fold(
        (f) => null, // db storage error, log here
        (urls) async {
          print('saving to firestore..');
          failureOrSuccess = _isCreating
              ? await _iStoreRepository.update(uploadingStore)
              : await _iStoreRepository.create(uploadingStore);
        },
      );

      failureOrSuccess.fold(
        (f) => errorDialog(Get.context),
        (ok) async {
          Get.back();
          await successDialog(Get.context).show();
          Get.back(closeOverlays: true);
        },
      );
    } else {
      // stoer is not valid
    }
  }

  Future<Either<ImageFailure, Unit>> _uploadStorePics() async {
    print('uploading store pics..');
    final String path = "stores/store_${store.id}/pics";
    final List<Either<ImageFailure, String>> fOrUrlList = [];

    await Future.forEach<Either<File, String>>(
      store.pics,
      (pic) => pic.fold(
        (file) async {
          final cmpFile = await _iImageRepository.compressImage(file);
          final failureOrUrl =
              await _iImageRepository.uploadFileImage(cmpFile, path);
          fOrUrlList.add(failureOrUrl);
        },
        (url) => fOrUrlList.add(right(url)),
      ),
    );

    Option<ImageFailure> failureOption = none();
    final List<String> urlOnlyList = [];

    for (final fOrUrl in fOrUrlList) {
      fOrUrl.fold(
        (f) {
          failureOption = some(f);
        },
        (url) => urlOnlyList.add(url),
      );
    }

    if (failureOption.isNone()) {
      _storePrim = store.copyWith(
        pics: urlOnlyList.map((url) => right<File, String>(url)).toList(),
      );
      return right(unit);
    } else {
      return left(failureOption.getOrElse(() => null));
    }
  }

  Future<Either<ImageFailure, Unit>> _uploadBannerPic() async {
    print('uploading banner..');
    final path = "stores/store_${store.id}/banner";
    final failureOrUrl = await store.banner.fold(
        (file) => _iImageRepository.uploadFileImage(file, path),
        (url) => Future(() => right<ImageFailure, String>(url)));

    return failureOrUrl.fold(
      (f) => left(f),
      (url) {
        _storePrim = store.copyWith(banner: right(url));
        return right(unit);
      },
    );
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await initializeForm(initialStore: Get.arguments as Option<Store>);
  }

  @override
  void onClose() {
    _storePrim = null;
    _isCreating = null;
    super.onClose();
  }
}
