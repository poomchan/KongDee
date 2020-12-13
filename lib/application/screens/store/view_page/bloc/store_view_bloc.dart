import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/action_state.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_bloc.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

class StoreViewBloc extends GetxController
    with SimepleProgressSetter<StoreFailure> {
  final IStoreRepository _iStoreRepository = Get.find<IStoreRepository>();
  final ILocationRepository _iLocationRepository =
      Get.find<ILocationRepository>();
  final _authBloc = Get.find<AuthBloc>();

  StreamSubscription _storeSubscription;

  final _store = Rx<Store>();
  Store get store => _store.value;
  set store(Store store) => _store.value = store;

  bool get isStoreOwner => _authBloc.user.id == store.ownerId;

  Future<void> watchStoreStarted({@required UniqueId storeId}) async {
    assert(storeId != null);
    updateWithLoading();
    final locationOption = await _iLocationRepository.getLocation();
    locationOption.fold(
      (f) => updateWithFailure(StoreFailure.locationNotGranted()),
      (location) async {
        final Option<UserDomain> userOption = optionOf(_authBloc.user);
        _storeSubscription = _iStoreRepository
            .watchSingleStore(
                storeId: storeId, location: location, userOption: userOption)
            .listen(
          (storeOrF) {
            return storeOrF.fold(
              (f) => updateWithFailure(f),
              (store) {
                this.store = store;
                updateWithLoaded();
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<void> onReady() async {
    await watchStoreStarted(storeId: Get.arguments as UniqueId);
    super.onReady();
  }

  @override
  void onClose() {
    _storeSubscription.cancel();
    _store.close();
    Get.delete<StoreSettingBloc>();
    super.onClose();
  }
}
