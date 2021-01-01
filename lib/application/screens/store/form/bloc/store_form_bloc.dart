// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/state_setter.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_state.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/location/location_bloc.dart';
import 'package:fluttertaladsod/application/core/components/dialogs.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/image/i_image_repository.dart';
import 'package:fluttertaladsod/domain/image/image_failure.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';

class StoreFormBloc extends GetxController with MyStateSetter<StoreFormState, dynamic> {
  final IImageRepository _iImageRepository = Get.find();
  final IStoreRepository _iStoreRepository = Get.find();
  final LocationBloc _locationBloc = Get.find();
  final AuthBloc _authBloc = Get.find();

  void initializeForm() {
    final initialStoreOption = Get.arguments as Option<Store>;
    final location = _locationBloc.location;
    final user = _authBloc.user;
    setLoaded(StoreFormState.initialize(initialStoreOption, location, user));
  }

  Future<void> bannerChangeRequested() async {
    final imageOption = await _iImageRepository.getImage();
    imageOption.fold(
      () => null,
      (img) => setLoaded(state.copyWith(banner: left(img))),
    );
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
      (img) => setLoaded(state.copyWith(pics: state.pics..add(left(img)))),
    );
  }

  void picDeleteRequested(int picIndex) {
    setLoaded(state.copyWith(pics: state.pics..removeAt(picIndex)));
  }

  void zoomImage(int index) {
    print('zooming');
  }

  Future<void> saved() async {
    if (state.isStoreValid) {
      savingDialog(Get.context).show();
      final fOrBannerUrl = await _uploadStoreBanner();
      final fOrPicsUrl = await _uploadStorePics();
      Either<dynamic, Unit> failureOrSuccess =
          fOrBannerUrl.flatMap((bannerUrl) {
        setState(state.copyWith(banner: right(bannerUrl)));
        return fOrPicsUrl;
      }).flatMap((picUrls) {
        setState(state.copyWith(
          pics: picUrls.map((picUrl) => right<File, String>(picUrl)).toList(),
        ));
        return right(unit);
      });

      failureOrSuccess.fold(
        (f) => print('storeage failure'),
        (success) async {
          final uploadingStore = state.store;
          if (!uploadingStore.isValid) return;
          failureOrSuccess = state.isCreating
              ? await _iStoreRepository.create(uploadingStore)
              : await _iStoreRepository.update(uploadingStore);
        },
      );

      failureOrSuccess.fold(
        (f) => errorDialog(Get.context),
        (ok) async {
          Get.back(closeOverlays: true);
          await successDialog(Get.context).show();
          Get.back();
        },
      );
    } else {
      print('invalid store');
    }
  }

  Future<Either<ImageFailure, String>> _uploadStoreBanner() async {
    print('uploading banner..');
    final path = "stores/store_${state.storeId.getOrCrash()}/banner";
    final failureOrUrl = await state.banner.fold(
        (file) => _iImageRepository.uploadFileImage(file, path),
        (url) => Future(() => right<ImageFailure, String>(url)));
    return failureOrUrl.fold((f) => left(f), (url) => right(url));
  }

  Future<Either<ImageFailure, List<String>>> _uploadStorePics() async {
    print('uploading store pics..');
    final String path = "stores/store_${state.storeId.getOrCrash()}/pics";
    final List<Either<ImageFailure, String>> fOrUrlList = [];
    await Future.forEach<Either<File, String>>(
      state.pics,
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
        (f) => failureOption = some(f),
        (url) => urlOnlyList.add(url),
      );
      if (failureOption.isSome()) break;
    }
    return failureOption.fold(
      () => right(urlOnlyList),
      (f) => left(f),
    );
  }

  @override
  void onInit() {
    initializeForm();
    super.onInit();
  }

  @override
  void onClose() {
    state.dispose();
    super.onClose();
  }
}
