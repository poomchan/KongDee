import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/location/location_failures.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@prod
@LazySingleton(as: ILocationRepository)
class LocationRepository implements ILocationRepository {
  @override
  Future<Either<LocationFailures, Unit>> requestLocationPermission() async {
    // do the request
    final PermissionStatus status = await Permission.location.request();
    print(status);
    if (status.isGranted) {
      return right(unit);
    } else {
      return left(const LocationFailures.cancleByUser());
    }
  }

  @override
  Future<bool> checkPermissionStatus() async {
    final bool isLocationGranted = await Permission.location.isGranted;
    if (isLocationGranted) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> openAppSetting() async {
    await openLocationSettings();
  }

  @override
  Future<Option<LocationDomain>> getLocation() async {
    var error;
    // get coordinates
    final Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
            .catchError((err) => error = err);

    // get full address
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    final Placemark placemark = placemarks[0];
    final completeAddress =
        '${placemark.subThoroughfare}/ ${placemark.thoroughfare}/ '
        '${placemark.subLocality}/ ${placemark.locality}/ '
        '${placemark.subAdministrativeArea}/ '
        '${placemark.administrativeArea}/ ${placemark.postalCode}/ '
        '${placemark.country} ';
    final formattedAddress =
        '${placemark.subLocality}, ${placemark.locality}, ${placemark.country}';

    // get geohash
    // Init firestore and geoFlutterFire
    final Geoflutterfire geo = Geoflutterfire();
    final GeoFirePoint myGeoPoint =
        geo.point(latitude: position.latitude, longitude: position.longitude);
    if (error != null) {
      return none();
    } else {
      return some(LocationDomain(
          fullAddress: completeAddress,
          formattedAddress: formattedAddress,
          geoFirePoint: myGeoPoint,
          position: position));
    }
  }
}
