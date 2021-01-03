// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_bloc.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/domain/user/user.dart';

class StoreViewBloc extends GetxController
    with SimepleProgressSetter<StoreFailure> {
  final IStoreRepository _iStoreRepository = Get.find();
  final ILocationRepository _iLocationRepository = Get.find();
  final AuthBloc _authBloc = Get.find();

  StreamSubscription _storeSub;

  final _store = Rx<Store>();
  Store get store => _store.value;
  Rx<Store> get rxStore => _store;
  set store(Store store) => _store.value = store;

  bool get isStoreOwner => _authBloc.user?.id == store?.ownerId ?? false;

  Future<void> watchStoreStarted({@required UniqueId storeId}) async {
    assert(storeId != null);
    updateWithLoading();
    final locationOption = await _iLocationRepository.getLocation();
    locationOption.fold(
      (f) => updateWithFailure(StoreFailure.locationNotGranted()),
      (location) async {
        final Option<UserDomain> userOption = optionOf(_authBloc.user);
        _storeSub = _iStoreRepository
            .watchSingleStore(
                storeId: storeId, location: location, userOption: userOption)
            .listen(
          (storeOrF) {
            return storeOrF.fold(
              (f) => updateWithFailure(f),
              (store) {
                this.store = store;
                filterBlockedUsers(store);
                updateWithLoaded();
              },
            );
          },
        );
      },
    );
  }

  void filterBlockedUsers(Store s) {
    final isAuth = _authBloc.isAuth;
    if (isAuth) {
      final watcherId = _authBloc.user.id;
      if (s.blockedUsers[watcherId.getOrCrash()] == true) {
        Get.offAllNamed(Routes.homePage);
      }
    }
  }

  void onMoreTapped() {
    print('more!');
  }

  Future<void> onStoreOpenToggled({@required bool isOpen}) async {
    updateWithLoading();
    await _iStoreRepository.update(
      store.copyWith(
        prefs: store.prefs.copyWith(isOpen: isOpen),
      ),
    );
    updateWithLoaded();
  }

  @override
  Future<void> onReady() async {
    await watchStoreStarted(storeId: Get.arguments as UniqueId);
    super.onReady();
  }

  @override
  void onClose() {
    _storeSub.cancel();
    _store.close();
    Get.delete<StoreSettingBloc>();
    super.onClose();
  }
}
