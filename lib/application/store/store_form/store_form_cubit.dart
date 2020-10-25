import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/i_image_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_form_state.dart';
part 'store_form_cubit.freezed.dart';

@prod
@injectable
class StoreFormCubit extends Cubit<StoreFormState> {
  final IImageRepository _iImageRepository;
  final IStoreRepository _iStoreRepository;

  StoreFormCubit(this._iImageRepository, this._iStoreRepository)
      : super(StoreFormState.initial());

  Future<void> initializeForm({
    @required Option<Store> initialStore,
  }) async {
    initialStore.fold(
        // if no initial store (create)
        () => emit(
              state.copyWith(
                store: Store.created(),
              ),
            ),
        // have initial store
        (initStore) async {
      // wait for the UI (listener) to be built
      await Future.delayed(Duration(milliseconds: 10));
      emit(
        state.copyWith(
          store: initStore,
          isEditting: true,
        ),
      );
      // print('just emitted the state');
    });
  }

  Future<void> nameChanged(String newName) async {
    emit(
      state.copyWith(
        store: state.store.copyWith(name: StoreName(newName)),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> menuChanged(String newMenu) async {
    emit(
      state.copyWith(
        store: state.store.copyWith(
          menu: StoreMenu(newMenu),
        ),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> bannerChangeRequested() async {
    final imageOption = await _iImageRepository.getImage();
    imageOption.fold(
      () => null,
      (img) => emit(
        state.copyWith(
          store: state.store.copyWith(banner: StoreBanner.file(img)),
        ),
      ),
    );
  }

  Future<void> picsChangeRequested() async {
    final imageOption = await _iImageRepository.getImage();
    imageOption.fold(
      () => null,
      (img) {
        final List<StorePic> newList = List.from(state.store.pics.getOrCrash());
        newList.add(StorePic.file(img));
        emit(
          state.copyWith(
            store: state.store.copyWith(
              pics: StorePic16(newList),
            ),
          ),
        );
      },
    );
  }

  Future<void> picDeleteRequested(int picIndex) async {
    assert(picIndex != null);
    final List<StorePic> newList = List.from(state.store.pics.getOrCrash());
    newList.removeAt(picIndex);
    emit(
      state.copyWith(
        store: state.store.copyWith(
          pics: StorePic16(newList),
        ),
      ),
    );
  }

  Future<void> saved({@required LocationDomain location}) async {
    Either<StoreFailure, Unit> failureOrSuccess;

    // send the latest store to firestore (either update or create is checked by [isEditting])
    if (state.store.failureOption.isNone()) {
      emit(
        state.copyWith(
            isSaving: true,
            saveFailureOrSuccessOption: none(),
            store: state.store.copyWith(
              formattedAddress: location.formattedAddress,
            )),
      );
      await Future.wait([
        _uploadBannerPic(),
        _uploadStorePics(),
      ]).then((fOrSuccessList) {
        print(fOrSuccessList);
        failureOrSuccess = fOrSuccessList[0].flatMap((_) => fOrSuccessList[1]);
      });

      await failureOrSuccess.fold(
        (f) => null, // db storage error, log here
        (ok) async {
          print('saving to database');
          failureOrSuccess = state.isEditting
              ? await _iStoreRepository.update(state.store, location)
              : await _iStoreRepository.create(state.store, location);
        },
      );
    }

    emit(state.copyWith(
      isSaving: false,
      showErrorMessage: true,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  Future<Either<StoreFailure, Unit>> _uploadStorePics() async {
    print('uploading store pics');
    // 1. check and upload the new pics
    // 2. get the download url, append it to a new list
    // 3. set a new list as the latest pics state of the store

    final String path = "stores/store_${state.store.id.getOrCrash()}/pics";

    final List<StorePic> storePics = List.from(state.store.pics.getOrCrash());

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

    for (final fOrUrl in fOrUrlList) {
      fOrUrl.fold(
        (f) {
          failureOption = some(f);
        },
        (ok) => null,
      );
    }

    final List<StorePic> urlOnlyList = [];

    return failureOption.fold(() {
      urlOnlyList.addAll(
        fOrUrlList.map(
          (fOrUrl) => StorePic.url(fOrUrl.getOrElse(() => null)),
        ),
      );

      emit(state.copyWith(
        store: state.store.copyWith(
          pics: StorePic16(urlOnlyList),
        ),
      ));

      return right<StoreFailure, Unit>(unit);

    }, (f) => left<StoreFailure, Unit>(f));
  }

  Future<Either<StoreFailure, Unit>> _uploadBannerPic() async {
    print('uploading banner');
    // 1. check and upload the new pic
    // 2. get the download url
    // 3. set a url as the latest banner state of the store
    final path = "stores/store_${state.store.id.getOrCrash()}/banner";
    final failureOrUrl = await state.store.banner.getOrCrash().fold(
        (file) => _iStoreRepository.uploadFileImage(file, path),
        (url) => Future(() => right<StoreFailure, String>(url)));

    return failureOrUrl.fold((f) => left(f), (url) {
      emit(state.copyWith(
        store: state.store.copyWith(
          banner: StoreBanner.url(url),
        ),
      ));
      return right(unit);
    });
  }
}
