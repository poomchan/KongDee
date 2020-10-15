
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@module
abstract class LocationInjectableModule {
  @lazySingleton
  Geoflutterfire get geoFlutterFire => Geoflutterfire();
  @lazySingleton
  Location get location => Location.instance;
}
