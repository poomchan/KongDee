import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/bloc/location/location_bloc.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

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

  void watchNearbyStore() {
    updateWithLoading();
    final location = _locationBloc.location;
    final user = _authBloc.user;
    storeSub = _iStoreRepository
        .watchNearbyStore(
          location: location,
          rad: radiusSubject,
          userOption: optionOf(user),
        )
        .listen(
          (failureOrStoreList) => failureOrStoreList.fold(
            (f) => updateWithFailure(f),
            (storeList) {
              this.storeList = filterBlocked(storeList).obs;
              updateWithLoaded();
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
    updateWithLoading();
    _rad.value += 0.5;
    radiusSubject.add(rad);
  }

  void drainRadius() {
    _rad.value = initRad;
    radiusSubject.add(rad);
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
