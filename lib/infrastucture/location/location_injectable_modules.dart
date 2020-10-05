import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LocationInjectableModule {
  @lazySingleton
  Geoflutterfire get geoFlutterFire => Geoflutterfire();
}
