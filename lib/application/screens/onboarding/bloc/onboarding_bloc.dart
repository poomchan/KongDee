import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/application/bloc/core/action_state.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location_failure.dart';
import 'package:get/get.dart';

class OnboardingCubit extends GetxController with SimpleStateSetter {
  final ILocationRepository _locationRepository =
      Get.find<ILocationRepository>();

  Future<void> requestLocationPermission() async {
    final Either<LocationFailure, Unit> result =
        await _locationRepository.requestLocationPermission();
    result.fold(
      (f) => _locationRepository.openAppSetting(),
      (ok) => Get.toNamed(Routes.homePage),
    );
  }
}
