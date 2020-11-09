import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/location/location.dart';

import 'location_failures.dart';

abstract class ILocationRepository {
  Future<Either<LocationFailures, Unit>> requestLocationPermission();
  Future<bool> isPermissionGranted();
  Future<Option<LocationDomain>> getLocation();
  Future<void> openAppSetting();
}
