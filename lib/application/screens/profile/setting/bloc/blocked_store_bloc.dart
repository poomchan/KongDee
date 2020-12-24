import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/bloc/location/location_bloc.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:get/get.dart';

class BlockedStoreBloc extends GetxController
    with SimepleProgressSetter<StoreFailure> {
  IStoreRepository get _iStoreRepository => Get.find();
  LocationBloc get _locationBloc => Get.find();
  AuthBloc get _authBloc => Get.find();

  List<Store> storeList = [];
  List<StreamSubscription> subList = [];

  Future<void> watchStores() async {
    try {
      updateWithLoading();
      final map = _authBloc.user.blockedStores;
      for (final id in map.keys) {
        if (map[id] == true) {
          final fOrStoreStream = _iStoreRepository.watchSingleStore(
            storeId: id,
            location: _locationBloc.location,
            userOption: some(_authBloc.user),
          );
          final storeSub = fOrStoreStream.listen((fOrStore) {
            return fOrStore.fold(
              (f) => updateWithFailure(f),
              (store) {
                storeList.add(store);
                updateWithLoaded();
              },
            );
          });
          subList.add(storeSub);
        }
      }
      updateWithLoaded();
    } catch (err) {
      print(err);
    }
  }

  @override
  void onClose() {
    subList.forEach((sub) => sub.cancel());
    super.onClose();
  }

  @override
  void onReady() {
    watchStores();
    super.onReady();
  }
}
