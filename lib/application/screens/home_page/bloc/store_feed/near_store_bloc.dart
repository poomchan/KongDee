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

class NearStoreBloc extends GetxController with SimepleProgressSetter<StoreFailure> {
  final _iStoreRepository = Get.find<IStoreRepository>();
  final _authBloc = Get.find<AuthBloc>();
  final _locationBloc = Get.find<LocationBloc>();

  static const initRad = 1.0;

  RxList<Store> storeList = List<Store>.empty().obs;
  StreamSubscription storeSub;

  final _rad = 1.0.obs;
  double get rad => _rad.value;

  final radiusSubject = BehaviorSubject<double>.seeded(1.0);

  @override
  Future<void> onReady() async {
    super.onReady();
    await watchNearbyStore();
  }

  Future<void> watchNearbyStore() async {
    updateWithLoading();
    final location = _locationBloc.location;
    final user = _authBloc.user;
    storeSub = _iStoreRepository
        .watchNearbyStore(
            location: location, rad: radiusSubject, userOption: optionOf(user))
        .listen(
          (failureOrStoreList) => failureOrStoreList.fold(
            (f) => updateWithFailure(f),
            (storeList) {
              this.storeList = storeList.obs;
              updateWithLoaded();
            },
          ),
        );
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
    storeList.close();
    _rad.close();
    radiusSubject.close();
    storeSub.cancel();
    super.onClose();
  }
}
