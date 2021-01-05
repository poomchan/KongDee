// Dart imports:
import 'dart:async';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/bloc/location/location_bloc.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';

class NearStoreBloc extends GetxController
    with SimepleProgressSetter<StoreFailure> {
  IStoreRepository get _iStoreRepository => Get.find();
  AuthBloc get _authBloc => Get.find();
  LocationBloc get _locationBloc => Get.find();

  static const initRad = 1.0;

  RxList<Store> storeList = List<Store>.empty().obs;
  StreamSubscription storeSub;
  StreamSubscription authSub;

  final _rad = 1.0.obs;
  double get rad => _rad.value;

  final radiusSubject = BehaviorSubject<double>.seeded(1.0);

  @override
  void onReady() {
    super.onReady();
    watchNearbyStore();
    authSub = _authBloc.rxUser.listen((_) => watchNearbyStore());
  }

  Future<void> watchNearbyStore() async {
    setLoading();
    final location = _locationBloc.location;
    final user = _authBloc.user;
    storeSub?.cancel();
    storeSub = _iStoreRepository
        .watchNearbyStore(
          location: location,
          rad: radiusSubject,
          userOption: optionOf(user),
        )
        .listen(
          (failureOrStoreList) => failureOrStoreList.fold(
            (f) => setFailure(f),
            (storeList) {
              this.storeList = filterBlocked(storeList).obs;
              setLoaded();
            },
          ),
        );
  }

  List<Store> filterBlocked(List<Store> sl) {
    if (_authBloc.isAuth) {
      final List<Store> filteredList = [];
      final watcherId = _authBloc.user.id.getOrCrash();
      final userBlocked = _authBloc.user.blockedStores;
      for (final s in sl) {
        final blockedByUser = userBlocked[s.id.getOrCrash()] == true;
        final blockedByStore = s.blockedUsers[watcherId] != true;
        if (!blockedByUser || !blockedByStore) filteredList.add(s);
      }
      return filteredList;
    }
    return sl;
  }

  void requestMoreRadius() {
    setLoading();
    _rad.value += 0.5;
    radiusSubject.add(rad);
  }

  Future<void> onResetTapped() async {
    _rad.value = initRad;
    radiusSubject?.add(rad);
    setLoading();
    print('loading...');
    await Future.delayed(Duration(milliseconds: 1000));
    print('loaded');

  }

  @override
  void onClose() {
    storeList?.close();
    _rad?.close();
    radiusSubject?.close();
    storeSub?.cancel();
    authSub?.cancel();
    super.onClose();
  }
}
