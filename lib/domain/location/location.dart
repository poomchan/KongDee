import 'package:fluttertaladsod/domain/core/entity.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';

part 'location.freezed.dart';

@immutable
@freezed
abstract class LocationDomain implements _$LocationDomain {
  @Implements(IEntity)
  const factory LocationDomain({
    @required UniqueId id,
    @required LocationData locationData,
    @required GeoFirePoint geoFirePoint,
    @required Placemark placemark,
  }) = _LocationDomain;

  double get lat => locationData.latitude;
  double get lng => locationData.longitude;
  double distanceFrom(double lat, double lng) =>
      geoFirePoint.distance(lat: lat, lng: lng);

  const LocationDomain._();
}
