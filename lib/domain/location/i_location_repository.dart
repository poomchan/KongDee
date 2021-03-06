// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:fluttertaladsod/domain/location/location.dart';
import 'location_failure.dart';

abstract class ILocationRepository {
  Future<Either<LocationFailure, Unit>> requestLocationPermission();
  Future<Either<LocationFailure, LocationDomain>> getLocation();
  Future<bool> isPermissionGranted();
  Future<void> openAppSetting();
}
