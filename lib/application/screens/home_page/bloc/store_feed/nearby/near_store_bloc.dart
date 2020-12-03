import 'dart:async';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'action_state.dart';

class NearStoreBloc extends GetxController with StateSetter<StoreFailure> {
  final _iStoreRepository = getIt<IStoreRepository>();
  final _iLocationRepository = getIt<ILocationRepository>();
  final _iAuthFacade = getIt<IAuthFacade>();
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
    setLoading();
    final locationOption = await _iLocationRepository.getLocation();
    locationOption.fold(
      () => setFailure(StoreFailure.noStore()),
      (location) async {
        final userOption = await _iAuthFacade.getSignedInUser();
        storeSub = _iStoreRepository
            .watchNearbyStore(
          location: location,
          rad: radiusSubject,
          userOption: userOption,
        )
            .listen(
          (failureOrStoreList) {
            failureOrStoreList.fold(
              (f) => setFailure(f),
              (storeList) {
                this.storeList = storeList.obs;
                setLoaded();
              },
            );
          },
        );
      },
    );
  }

  void requestMoreRadius() {
    setLoading();
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
