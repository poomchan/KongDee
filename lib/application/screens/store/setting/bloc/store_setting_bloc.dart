import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:get/get.dart';

class StoreSettingBloc extends GetxController
    with SimepleProgressSetter<StoreFailure> {
  StoreViewBloc get _watcherBloc => Get.find();
  ILocationRepository get _iLocationRepo => Get.find();
  IStoreRepository get _iStoreRepo => Get.find();

  StoreLocation location;
  SellingRange sellingRange;
  bool isInfinite = true;

  StoreViewBloc get watherBloc => _watcherBloc;

  Future<void> onLocationUpdated() async {
    updateWithLoading();
    final locationOption = await _iLocationRepo.getLocation();
    final locationDomain =
        locationOption.getOrElse(() => throw 'location not granted');
    location = StoreLocation.fromLocationDomain(locationDomain);
    updateWithLoading();
  }

  Future<void> onLocationSaved() async {
    updateWithLoading();
    final fOrUnit = await _iStoreRepo
        .update(_watcherBloc.store.copyWith(location: location));
    fOrUnit.fold(
      (f) => null,
      (ok) => Get.back(),
    );
  }

  void onInfiniteRangeToggled({bool isInf}) {
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
    updateWithLoading();
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
    updateWithLoading();
    final Store store = _watcherBloc.store;
    await _iStoreRepo.update(
      store.copyWith(
        prefs: store.prefs.copyWith(isOpen: isOpen),
      ),
    );
    updateWithLoaded();
  }

  Future<void> onStoreNotificationToggled({bool isOn}) async {
    updateWithLoading();
    final Store store = _watcherBloc.store;
    await _iStoreRepo.update(
      store.copyWith(
        prefs: store.prefs.copyWith(isNotificationOn: isOn),
      ),
    );
    updateWithLoaded();
  }

  void resetState() {
    location = _watcherBloc.store.location;
    sellingRange = _watcherBloc.store.prefs.sellingRange;
    if (!sellingRange.isInFinite) {
      isInfinite = false;
    } else {
      isInfinite = true;
    }
  }

  @override
  void onInit() {
    updateWithLoading();
    super.onInit();
    resetState();
    updateWithLoaded();
  }

  @override
  void onClose() {
    location = null;
    sellingRange = null;
    isInfinite = null;
    super.onClose();
  }
}
