// Package imports:
import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart' as _code;
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/location/location_failure.dart';

class LocationRepository implements ILocationRepository {
  final _location = Get.find<Location>();
  final _geofire = Get.find<Geoflutterfire>();
  final _geocode = Get.find<_code.GeocodingPlatform>();

  @override
  Future<Either<LocationFailure, Unit>> requestLocationPermission() async {
    try {
      final PermissionStatus status = await _location.requestPermission();
      if (status == PermissionStatus.granted) {
        return right(unit);
      } else if (status == PermissionStatus.denied) {
        return left(const LocationFailure.cancleByUser());
      } else {
        return left(const LocationFailure.insufficientPermission());
      }
    } catch (e) {
      return left(LocationFailure.unexpected(e));
    }
  }

  @override
  Future<bool> isPermissionGranted() async {
    final permission = await _location.hasPermission();
    if (permission == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> openAppSetting() async {
    await Geolocator.openLocationSettings();
  }

  /// completeAddress = [placemark.subThoroughfare]/[placemark.thoroughfare]}/[placemark.subLocality]/[placemark.locality]/[placemark.subAdministrativeArea]/[placemark.administrativeArea]/[placemark.postalCode]/[placemark.country]
  /// formattedAddress = [placemark.subLocality]/[placemark.locality]
  @override
  Future<Either<LocationFailure, LocationDomain>> getLocation() async {
    try {
      final LocationData position = await _location.getLocation();
      final List<_code.Placemark> placemarks = await _geocode
          .placemarkFromCoordinates(position.latitude, position.longitude);
      final _code.Placemark placemark = placemarks[0];

      final GeoFirePoint myGeoPoint = _geofire.point(
          latitude: position.latitude, longitude: position.longitude);
      return right(LocationDomain(
        locationData: position,
        placemark: placemark,
        geoFirePoint: myGeoPoint,
        id: UniqueId.generated(),
      ));
    } catch (err) {
      return left(LocationFailure.unexpected(err));
    }
  }
}
