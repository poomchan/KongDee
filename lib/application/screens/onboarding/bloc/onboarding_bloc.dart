import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/application/bloc/core/action_state.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location_failure.dart';
import 'package:get/get.dart';

class OnboardingBloc extends GetxController with SimepleProgressSetter {
  final ILocationRepository _locationRepository =
      Get.find<ILocationRepository>();
  final int totalPages = 3;
  PageController pageController;

  Future<void> requestLocationPermission() async {
    final Either<LocationFailure, Unit> result =
        await _locationRepository.requestLocationPermission();
    result.fold(
      (f) => _locationRepository.openAppSetting(),
      (ok) => Get.toNamed(Routes.homePage),
    );
  }

  @override
  void onReady() {
    super.onReady();
    pageController = PageController(initialPage: Get.arguments as int);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
