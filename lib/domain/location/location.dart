import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

part 'location.freezed.dart';

@immutable
@freezed
abstract class LocationDomain with _$LocationDomain {
  const factory LocationDomain({
    @required GeoFirePoint geoFirePoint,
    @required Placemark placemark,
  }) = _LocationDomain;
}
