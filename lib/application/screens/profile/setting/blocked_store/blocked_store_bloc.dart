// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/bloc/location/location_bloc.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';

class BlockedStoreBloc extends GetxController
    with SimepleProgressSetter<StoreFailure> {
  final IStoreRepository _iStoreRepository = Get.find();
  final LocationBloc _locationBloc = Get.find();
  final  AuthBloc _authBloc = Get.find();

  List<Store> storeList = [];
  List<StreamSubscription> subList = [];

  Future<void> watchStores() async {
    try {
      setLoading();
      final map = _authBloc.user.blockedStores;
      for (final id in map.keys) {
        if (map[id] == true) {
          final fOrStoreStream = _iStoreRepository.watchSingleStore(
            storeId: UniqueId.fromUniqueString(id),
            location: _locationBloc.location,
            userOption: some(_authBloc.user),
          );
          final storeSub = fOrStoreStream.listen((fOrStore) {
            return fOrStore.fold(
              (f) => setFailure(f),
              (store) {
                storeList.add(store);
                setLoaded();
              },
            );
          });
          subList.add(storeSub);
        }
      }
      setLoaded();
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
