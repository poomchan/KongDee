import 'package:fluttertaladsod/application/bloc/core/action_state.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:get/get.dart';

class StoreSettingBloc extends GetxController
    with SimpleStateSetter<StoreFailure> {
  final _watcherBloc = Get.find<StoreViewBloc>();
  final _iLocationRepo = Get.find<ILocationRepository>();
  final _iStoreRepo = Get.find<IStoreRepository>();
  StoreLocation location;
  SellingRange sellingRange;
  bool isInfinite = true;

  Future<void> onLocationUpdated() async {
    setLoadingState();
    final locationOption = await _iLocationRepo.getLocation();
    final locationDomain =
        locationOption.getOrElse(() => throw 'location not granted');
    location = StoreLocation.fromLocationDomain(locationDomain);
    setLoadingState();
    update();
  }

  Future<void> onLocationSaved() async {
    setLoadingState();
    final fOrUnit = await _iStoreRepo
        .update(_watcherBloc.store.copyWith(location: location));
    fOrUnit.fold(
      (f) => null,
      (ok) => Get.back(),
    );
  }

  void onInfiniteRangeChanged({bool isInf}) {
    if (isInf) {
      sellingRange = SellingRange.infinite();
    } else {
      final defaultSellingRange = _watcherBloc.store.prefs.sellingRange;
      if (defaultSellingRange.isInFinite) {
        sellingRange = SellingRange.created();
      } else {
        sellingRange = defaultSellingRange;
      }
    }
    update();
  }

  void onSellingRangeChanged(String val) {
    try {
      final numVal = double.parse(val);
      sellingRange = SellingRange(numVal);
      update();
    } catch (e) {}
  }

  Future<void> onSellingRangeSaved() async {
    setLoadingState();
    final Store store = _watcherBloc.store;
    final fOrUnit = await _iStoreRepo.update(
      store.copyWith(
        prefs: store.prefs.copyWith(sellingRange: sellingRange),
      ),
    );
    fOrUnit.fold(
      (f) => null,
      (ok) => Get.back(),
    );
  }

  Future<void> onStoreOpenToggled({bool isOpen}) async {
    setLoadingState();
    final Store store = _watcherBloc.store;
    await _iStoreRepo.update(
      store.copyWith(
        prefs: store.prefs.copyWith(isOpen: isOpen),
      ),
    );
    setLoadedState();
  }

  Future<void> onStoreNotificationToggled({bool isOn}) async {
    setLoadingState();
    final Store store = _watcherBloc.store;
    await _iStoreRepo.update(
      store.copyWith(
        prefs: store.prefs.copyWith(isNotificationOn: isOn),
      ),
    );
    setLoadedState();
  }

  @override
  void onInit() {
    setLoadingState();
    super.onInit();
    location = _watcherBloc.store.location;
    sellingRange = _watcherBloc.store.prefs.sellingRange;
    if (!sellingRange.isInFinite) {
      isInfinite = false;
    }
    setLoadedState();
  }

  @override
  void onClose() {
    location = null;
    sellingRange = null;
    isInfinite = null;
    super.onClose();
  }
}
