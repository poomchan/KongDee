// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StoreLocation _$StoreLocationFromJson(Map<String, dynamic> json) {
  return _StoreLocation.fromJson(json);
}

class _$StoreLocationTearOff {
  const _$StoreLocationTearOff();

// ignore: unused_element
  _StoreLocation call(
      {@required @JsonKey(defaultValue: '') String address,
      @GeoFirePointConverter() GeoFirePoint geoFirePoint,
      @JsonKey(ignore: true) double distanceAway}) {
    return _StoreLocation(
      address: address,
      geoFirePoint: geoFirePoint,
      distanceAway: distanceAway,
    );
  }
}

// ignore: unused_element
const $StoreLocation = _$StoreLocationTearOff();

mixin _$StoreLocation {
  @JsonKey(defaultValue: '')
  String get address;
  @GeoFirePointConverter()
  GeoFirePoint get geoFirePoint;
  @JsonKey(ignore: true)
  double get distanceAway;

  Map<String, dynamic> toJson();
  $StoreLocationCopyWith<StoreLocation> get copyWith;
}

abstract class $StoreLocationCopyWith<$Res> {
  factory $StoreLocationCopyWith(
          StoreLocation value, $Res Function(StoreLocation) then) =
      _$StoreLocationCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: '') String address,
      @GeoFirePointConverter() GeoFirePoint geoFirePoint,
      @JsonKey(ignore: true) double distanceAway});
}

class _$StoreLocationCopyWithImpl<$Res>
    implements $StoreLocationCopyWith<$Res> {
  _$StoreLocationCopyWithImpl(this._value, this._then);

  final StoreLocation _value;
  // ignore: unused_field
  final $Res Function(StoreLocation) _then;

  @override
  $Res call({
    Object address = freezed,
    Object geoFirePoint = freezed,
    Object distanceAway = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed ? _value.address : address as String,
      geoFirePoint: geoFirePoint == freezed
          ? _value.geoFirePoint
          : geoFirePoint as GeoFirePoint,
      distanceAway: distanceAway == freezed
          ? _value.distanceAway
          : distanceAway as double,
    ));
  }
}

abstract class _$StoreLocationCopyWith<$Res>
    implements $StoreLocationCopyWith<$Res> {
  factory _$StoreLocationCopyWith(
          _StoreLocation value, $Res Function(_StoreLocation) then) =
      __$StoreLocationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: '') String address,
      @GeoFirePointConverter() GeoFirePoint geoFirePoint,
      @JsonKey(ignore: true) double distanceAway});
}

class __$StoreLocationCopyWithImpl<$Res>
    extends _$StoreLocationCopyWithImpl<$Res>
    implements _$StoreLocationCopyWith<$Res> {
  __$StoreLocationCopyWithImpl(
      _StoreLocation _value, $Res Function(_StoreLocation) _then)
      : super(_value, (v) => _then(v as _StoreLocation));

  @override
  _StoreLocation get _value => super._value as _StoreLocation;

  @override
  $Res call({
    Object address = freezed,
    Object geoFirePoint = freezed,
    Object distanceAway = freezed,
  }) {
    return _then(_StoreLocation(
      address: address == freezed ? _value.address : address as String,
      geoFirePoint: geoFirePoint == freezed
          ? _value.geoFirePoint
          : geoFirePoint as GeoFirePoint,
      distanceAway: distanceAway == freezed
          ? _value.distanceAway
          : distanceAway as double,
    ));
  }
}

@JsonSerializable()
class _$_StoreLocation implements _StoreLocation {
  const _$_StoreLocation(
      {@required @JsonKey(defaultValue: '') this.address,
      @GeoFirePointConverter() this.geoFirePoint,
      @JsonKey(ignore: true) this.distanceAway})
      : assert(address != null);

  factory _$_StoreLocation.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreLocationFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String address;
  @override
  @GeoFirePointConverter()
  final GeoFirePoint geoFirePoint;
  @override
  @JsonKey(ignore: true)
  final double distanceAway;

  @override
  String toString() {
    return 'StoreLocation(address: $address, geoFirePoint: $geoFirePoint, distanceAway: $distanceAway)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreLocation &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.geoFirePoint, geoFirePoint) ||
                const DeepCollectionEquality()
                    .equals(other.geoFirePoint, geoFirePoint)) &&
            (identical(other.distanceAway, distanceAway) ||
                const DeepCollectionEquality()
                    .equals(other.distanceAway, distanceAway)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(geoFirePoint) ^
      const DeepCollectionEquality().hash(distanceAway);

  @override
  _$StoreLocationCopyWith<_StoreLocation> get copyWith =>
      __$StoreLocationCopyWithImpl<_StoreLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreLocationToJson(this);
  }
}

abstract class _StoreLocation implements StoreLocation {
  const factory _StoreLocation(
      {@required @JsonKey(defaultValue: '') String address,
      @GeoFirePointConverter() GeoFirePoint geoFirePoint,
      @JsonKey(ignore: true) double distanceAway}) = _$_StoreLocation;

  factory _StoreLocation.fromJson(Map<String, dynamic> json) =
      _$_StoreLocation.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String get address;
  @override
  @GeoFirePointConverter()
  GeoFirePoint get geoFirePoint;
  @override
  @JsonKey(ignore: true)
  double get distanceAway;
  @override
  _$StoreLocationCopyWith<_StoreLocation> get copyWith;
}
