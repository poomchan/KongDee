import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/bloc/location/location_bloc.dart';
import 'package:fluttertaladsod/application/core/components/dialogs.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/store/i_image_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

class StoreFormBloc extends GetxController with SimepleProgressSetter {
  IImageRepository get _iImageRepository => Get.find();
  IStoreRepository get _iStoreRepository => Get.find();
  IAuthFacade get _iAuthFacade => Get.find();
  LocationBloc get _locationBloc => Get.find();

  Store _store = Store.created();
  Store get store => _store;
  void updateStore(Store store) {
    _store = store;
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
        updateStore(store.copyWith(
          location: StoreLocation.fromLocationDomain(location),
        ));
        updateWithLoaded();
      },
      (initStore) async {
        // await Future.delayed(Duration(milliseconds: 10));
        _isCreating = true;
        updateStore(initStore);
        updateWithLoaded();
      },
    );
  }

  void nameChanged(String newName) {
    updateStore(store.copyWith(name: StoreName(newName)));
  }

  void menuChanged(String newMenu) {
    updateStore(store.copyWith(menu: StoreMenu(newMenu)));
  }

  Future<void> bannerChangeRequested() async {
    final imageOption = await _iImageRepository.getImage();
    imageOption.fold(
      () => null,
      (img) => updateStore(store.copyWith(
        banner: StoreBanner.file(img),
      )),
    );
  }

  Future<void> picsSelectionRequested() async {
    final imageOption = await _iImageRepository.getImage();
    imageOption.fold(
      () => null,
      (img) {
        final List<StorePic> newList = List.from(store.pics.getOrCrash());
        newList.add(StorePic.file(img));
        updateStore(store.copyWith(pics: StorePic16(newList)));
      },
    );
  }

  Future<void> zoomImage(int index) async {
    print('zooming');
  }

  Future<void> picDeleteRequested(int picIndex) async {
    assert(picIndex != null);
    final List<StorePic> newList = List.from(store.pics.getOrCrash());
    newList.removeAt(picIndex);
    updateStore(store.copyWith(pics: StorePic16(newList)));
  }

  Future<void> saved() async {
    Either<StoreFailure, Unit> failureOrSuccess;
    // send the latest store to firestore (either update or create is checked by [isEditting])
    if (store.failureOption.isNone()) {
      savingDialog(Get.context).show();
      final userOption = await _iAuthFacade.getSignedInUser();
      final user = userOption.getOrElse(() => throw 'user not authenticated');
      updateStore(store.copyWith(ownerId: user.id));

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
              ? await _iStoreRepository.update(store)
              : await _iStoreRepository.create(store);
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

  Future<Either<StoreFailure, Unit>> _uploadStorePics() async {
    print('uploading store pics..');
    final String path = "stores/store_${store.id.getOrCrash()}/pics";

    final List<StorePic> storePics = List.from(store.pics.getOrCrash());

    final List<Either<StoreFailure, String>> fOrUrlList = [];
    await Future.forEach(
      storePics,
      (StorePic pic) => pic.fileOrUrl.fold(
        (file) async {
          final cmpFile = await _iImageRepository.compressImage(file);
          final failureOrUrl =
              await _iStoreRepository.uploadFileImage(cmpFile, path);
          fOrUrlList.add(failureOrUrl);
        },
        (url) => fOrUrlList.add(right(url)),
      ),
    );

    Option<StoreFailure> failureOption = none();
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
      _store = store.copyWith(
        pics: StorePic16(
          urlOnlyList.map((p) => StorePic.url(p)).toList(),
        ),
      );
      return right(unit);
    } else {
      return left(failureOption.getOrElse(() => null));
    }
  }

  Future<Either<StoreFailure, Unit>> _uploadBannerPic() async {
    print('uploading banner..');
    final path = "stores/store_${store.id.getOrCrash()}/banner";
    final failureOrUrl = await store.banner.getOrCrash().fold(
        (file) => _iStoreRepository.uploadFileImage(file, path),
        (url) => Future(() => right<StoreFailure, String>(url)));

    return failureOrUrl.fold(
      (f) => left(f),
      (url) {
        _store = store.copyWith(banner: StoreBanner.url(url));
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
    _store = null;
    _isCreating = null;
    super.onClose();
  }
}
