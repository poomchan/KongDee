import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:json_annotation/json_annotation.dart';

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}

class TimestampConverter implements JsonConverter<Timestamp, Object> {
  const TimestampConverter();

  @override
  Timestamp fromJson(Object json) {
    return json as Timestamp;
  }

  @override
  Object toJson(Timestamp timestamp) => Timestamp.now();
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