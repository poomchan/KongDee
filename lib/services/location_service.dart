import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class LocationService {
  String _formattedAddress;
  GeoFirePoint _geoPoint;

  double get lat {
    return _geoPoint.latitude;
  }

  double get lon {
    return _geoPoint.longitude;
  }

  String get formattedAddress {
    return _formattedAddress;
  }

  Map<String, Object> get geoPoint {
    return _geoPoint.data;
  }

  getUserLocation() async {
    // get coordinates
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    // get full address
    List<Placemark> placemarks = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    String completeAddress =
        '${placemark.subThoroughfare}/ ${placemark.thoroughfare}/ '
        '${placemark.subLocality}/ ${placemark.locality}/ '
        '${placemark.subAdministrativeArea}/ '
        '${placemark.administrativeArea}/ ${placemark.postalCode}/ '
        '${placemark.country} ';
    _formattedAddress =
        '${placemark.subLocality}, ${placemark.locality}, ${placemark.country}';

    // get geohash
    // Init firestore and geoFlutterFire
    Geoflutterfire geo = Geoflutterfire();
    GeoFirePoint myGeoPoint =
        geo.point(latitude: position.latitude, longitude: position.longitude);
    _geoPoint = myGeoPoint;
  }
}

LocationService locationService = LocationService();
