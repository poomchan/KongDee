import 'package:fluttertaladsod/application/bloc/core/action_state.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/location/location_failure.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class LocationBloc extends GetxController with SimepleProgressSetter<LocationFailure> {
  final _iLocationRepository = Get.find<ILocationRepository>();
  final _location = Rx<LocationDomain>();
  LocationDomain get location => _location.value;
  bool isLocationGranted = false;


  Future<void> checkLocationPermission() async {
    updateWithLoading();
    isLocationGranted = await _iLocationRepository.isPermissionGranted();
    if(isLocationGranted){
      await getUserLocation();
    } else {
      Get.offAllNamed(Routes.onboardingPage);
    }
    updateWithLoaded();
  }

  Future<void> getUserLocation() async {
    updateWithLoading();
    final fOrlocation = await _iLocationRepository.getLocation();
    fOrlocation.fold(
      (f) => f.maybeWhen(
        insufficientPermission: () => _iLocationRepository.openAppSetting(),
        unexpected: (err) => print(err),
        orElse: () => null,
      ),
      (location) {
        _location.value = location;
        Get.offAllNamed(Routes.homePage);
        updateWithLoaded();
      },
    );
  }

  @override
  Future<void> onReady() async {
    await checkLocationPermission();
    super.onReady();
  }

  @override
  void onClose() {
    _location.close();
    super.onClose();
  }
}
