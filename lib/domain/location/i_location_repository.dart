import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/location/location.dart';

import 'location_failure.dart';

abstract class ILocationRepository {
  Future<Either<LocationFailure, Unit>> requestLocationPermission();
  Future<bool> isPermissionGranted();
  Future<Either<LocationFailure, LocationDomain>> getLocation();
  Future<void> openAppSetting();
}
