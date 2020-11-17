import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/location/location_failures.dart';
import 'package:geocoding_platform_interface/geocoding_platform_interface.dart'
    as _code;
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@prod
@LazySingleton(as: ILocationRepository)
class LocationRepository implements ILocationRepository {
  final Location _location;
  final Geoflutterfire _geofire;
  LocationRepository(this._location, this._geofire);

  @override
  Future<Either<LocationFailures, Unit>> requestLocationPermission() async {
    final PermissionStatus status = await _location.requestPermission();
    if (status == PermissionStatus.granted) {
      return right(unit);
    } else {
      return left(const LocationFailures.insufficientPermission());
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

  @override
  Future<Option<LocationDomain>> getLocation() async {
    dynamic error;
    // get coordinates
    final LocationData position = await _location.getLocation();

    // get full address
    final List<_code.Placemark> placemarks = await _code
        .GeocodingPlatform.instance
        .placemarkFromCoordinates(position.latitude, position.longitude);
    final _code.Placemark placemark = placemarks[0];
    final completeAddress =
        '${placemark.subThoroughfare}/ ${placemark.thoroughfare}/ '
        '${placemark.subLocality}/ ${placemark.locality}/ '
        '${placemark.subAdministrativeArea}/ '
        '${placemark.administrativeArea}/ ${placemark.postalCode}/ '
        '${placemark.country} ';

    final formattedAddress = '${placemark.subLocality}, ${placemark.locality}';

    // get geohash
    // Init firestore and geoFlutterFire
    final GeoFirePoint myGeoPoint = _geofire.point(
        latitude: position.latitude, longitude: position.longitude);
    if (error != null) {
      return none();
    } else {
      return some(LocationDomain(
        placemark: placemark,
        geoFirePoint: myGeoPoint,
      ));
    }
  }
}
