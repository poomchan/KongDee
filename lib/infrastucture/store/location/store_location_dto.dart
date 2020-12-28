import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

part 'store_location_dto.freezed.dart';
part 'store_location_dto.g.dart';

@immutable
@freezed
abstract class StoreLocationDto implements _$StoreLocationDto {
  const factory StoreLocationDto({
    @required @nullable String address,
    @GeoFirePointConverter() GeoFirePoint geoFirePoint,
  }) = _StoreLocationDto;

  factory StoreLocationDto.fromDomain(StoreLocation l) {
    return StoreLocationDto(
      address: l.address.getOrCrash(),
      geoFirePoint: l.geoFirePoint,
    );
  }

  StoreLocation toDomain(LocationDomain l) {
    final distanceAway = l.geoFirePoint.distance(
      lat: geoFirePoint.latitude,
      lng: geoFirePoint.longitude,
    );
    return StoreLocation(
      address: StoreAddress(address),
      geoFirePoint: geoFirePoint,
      distanceAway: distanceAway,
    );
  }

  factory StoreLocationDto.fromJson(Map<String, dynamic> json) =>
      _$StoreLocationDtoFromJson(json);

  const StoreLocationDto._();
}

class GeoFirePointConverter implements JsonConverter<GeoFirePoint, dynamic> {
  const GeoFirePointConverter();
  @override
  GeoFirePoint fromJson(json) {
    assert(json!=null);
    final geoPoint = json['geopoint'] as GeoPoint;
    final geoFirePoint = GeoFirePoint(geoPoint.latitude, geoPoint.longitude);
    return geoFirePoint;
  }
  @override
  dynamic toJson(object) {
    assert(object != null);
    final geoFirePoint = object as GeoFirePoint;
    return geoFirePoint.data;
  }
}