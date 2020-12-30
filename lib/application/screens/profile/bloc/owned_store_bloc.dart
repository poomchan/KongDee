// Dart imports:
import 'dart:async';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';

class OwnedStoreBloc extends GetxController
    with SimepleProgressSetter<StoreFailure> {
  IStoreRepository get _iStoreRepo => Get.find();
  ILocationRepository get _iLocationRepo => Get.find();
  AuthBloc get _authBloc => Get.find();

  final _store = Store.created().obs;
  Store get store => _store.value;
  StreamSubscription _ownedStoreSub;

  Future<void> watchOwnedStoreStarted() async {
    updateWithLoading();

    final locationOption = await _iLocationRepo.getLocation();

    locationOption.fold(
      (f) => updateWithFailure(StoreFailure.locationNotGranted()),
      (location) {
        final user = _authBloc.progress.maybeWhen(
          loaded: () => _authBloc.user,
          orElse: () => throw 'user not authenticated',
        );

        _ownedStoreSub = _iStoreRepo
            .watchOwnedStore(
              ownerId: user.id,
              location: location,
              user: user,
            )
            .listen(
              (storeOrF) => storeOrF.fold(
                (f) => updateWithFailure(f),
                (store) {
                  _store.value = store;
                  updateWithLoaded();
                },
              ),
            );
      },
    );
  }

  @override
  Future<void> onReady() async {
    await watchOwnedStoreStarted();
    super.onReady();
  }

  @override
  void onClose() {
    _ownedStoreSub.cancel();
    _store.close();
    super.onClose();
  }
}
