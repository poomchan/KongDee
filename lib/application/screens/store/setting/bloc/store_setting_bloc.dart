// Package imports:
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';

class StoreSettingBloc extends GetxController
    with SimepleProgressSetter<StoreFailure> {
  final StoreViewBloc _viewBloc = Get.find();
  final ILocationRepository _iLocationRepo = Get.find();
  final IStoreRepository _iStoreRepo = Get.find();

  Store get store => _viewBloc.store;
  StoreLocation location;
  SellingRange sellingRange = SellingRange.created();
  bool isInfinite = true;
  Map<String, bool> blockedUsers = {};  

  Future<void> onLocationUpdated() async {
    setLoading();
    final locationOption = await _iLocationRepo.getLocation();
    final locationDomain =
        locationOption.getOrElse(() => throw 'location not granted');
    location = StoreLocation.fromLocationDomain(locationDomain);
    setLoading();
  }

  Future<void> onLocationSaved() async {
    setLoading();
    final fOrUnit = await _iStoreRepo
        .update(_viewBloc.store.copyWith(location: location));
    fOrUnit.fold(
      (f) => null,
      (ok) => Get.back(),
    );
  }

  void onInfiniteRangeToggled({bool isInf}) {
    if (isInf) {
      sellingRange = SellingRange.infinite();
    } else {
      final defaultSellingRange = _viewBloc.store.prefs.sellingRange;
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
    setLoading();
    final Store store = _viewBloc.store;
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

  Future<void> onStoreOpenToggled({@required bool isOpen}) async {
    setLoading();
    await _viewBloc.onStoreOpenToggled(isOpen: isOpen);
    setLoaded();
  }

  Future<void> onStoreNotificationToggled({bool isOn}) async {
    setLoading();
    final Store store = _viewBloc.store;
    await _iStoreRepo.update(
      store.copyWith(
        prefs: store.prefs.copyWith(isNotificationOn: isOn),
      ),
    );
    setLoaded();
  }

  void resetState() {
    location = _viewBloc.store.location;
    sellingRange = _viewBloc.store.prefs.sellingRange;
    if (!sellingRange.isInFinite) {
      isInfinite = false;
    } else {
      isInfinite = true;
    }
  }

  @override
  void onInit() {
    setLoading();
    super.onInit();
    resetState();
    setLoaded();
  }

  @override
  void onClose() {
    location = null;
    sellingRange = null;
    isInfinite = null;
    super.onClose();
  }
}
