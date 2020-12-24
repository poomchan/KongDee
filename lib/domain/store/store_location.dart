import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/infrastucture/core/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

part 'store_location.freezed.dart';
part 'store_location.g.dart';

@immutable
@freezed
abstract class StoreLocation with _$StoreLocation {
  const factory StoreLocation({
    @required @JsonKey(defaultValue: '') String address,
    @GeoFirePointConverter() GeoFirePoint geoFirePoint,
    @JsonKey(ignore: true) double distanceAway,
  }) = _StoreLocation;

  factory StoreLocation.created() {
    return StoreLocation(
      address: '',
    );
  }

  factory StoreLocation.fromLocationDomain(LocationDomain l) {
    return StoreLocation(
      address: l.placemark.subLocality,
      geoFirePoint: l.geoFirePoint,
    );
  }

  factory StoreLocation.fromJson(Map<String, dynamic> json) =>
      _$StoreLocationFromJson(json);

}
