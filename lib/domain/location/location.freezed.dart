// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LocationDomainTearOff {
  const _$LocationDomainTearOff();

// ignore: unused_element
  _LocationDomain call(
      {@required UniqueId id,
      @required LocationData locationData,
      @required GeoFirePoint geoFirePoint,
      @required Placemark placemark}) {
    return _LocationDomain(
      id: id,
      locationData: locationData,
      geoFirePoint: geoFirePoint,
      placemark: placemark,
    );
  }
}

// ignore: unused_element
const $LocationDomain = _$LocationDomainTearOff();

mixin _$LocationDomain {
  UniqueId get id;
  LocationData get locationData;
  GeoFirePoint get geoFirePoint;
  Placemark get placemark;

  $LocationDomainCopyWith<LocationDomain> get copyWith;
}

abstract class $LocationDomainCopyWith<$Res> {
  factory $LocationDomainCopyWith(
          LocationDomain value, $Res Function(LocationDomain) then) =
      _$LocationDomainCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      LocationData locationData,
      GeoFirePoint geoFirePoint,
      Placemark placemark});
}

class _$LocationDomainCopyWithImpl<$Res>
    implements $LocationDomainCopyWith<$Res> {
  _$LocationDomainCopyWithImpl(this._value, this._then);

  final LocationDomain _value;
  // ignore: unused_field
  final $Res Function(LocationDomain) _then;

  @override
  $Res call({
    Object id = freezed,
    Object locationData = freezed,
    Object geoFirePoint = freezed,
    Object placemark = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      locationData: locationData == freezed
          ? _value.locationData
          : locationData as LocationData,
      geoFirePoint: geoFirePoint == freezed
          ? _value.geoFirePoint
          : geoFirePoint as GeoFirePoint,
      placemark:
          placemark == freezed ? _value.placemark : placemark as Placemark,
    ));
  }
}

abstract class _$LocationDomainCopyWith<$Res>
    implements $LocationDomainCopyWith<$Res> {
  factory _$LocationDomainCopyWith(
          _LocationDomain value, $Res Function(_LocationDomain) then) =
      __$LocationDomainCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      LocationData locationData,
      GeoFirePoint geoFirePoint,
      Placemark placemark});
}

class __$LocationDomainCopyWithImpl<$Res>
    extends _$LocationDomainCopyWithImpl<$Res>
    implements _$LocationDomainCopyWith<$Res> {
  __$LocationDomainCopyWithImpl(
      _LocationDomain _value, $Res Function(_LocationDomain) _then)
      : super(_value, (v) => _then(v as _LocationDomain));

  @override
  _LocationDomain get _value => super._value as _LocationDomain;

  @override
  $Res call({
    Object id = freezed,
    Object locationData = freezed,
    Object geoFirePoint = freezed,
    Object placemark = freezed,
  }) {
    return _then(_LocationDomain(
      id: id == freezed ? _value.id : id as UniqueId,
      locationData: locationData == freezed
          ? _value.locationData
          : locationData as LocationData,
      geoFirePoint: geoFirePoint == freezed
          ? _value.geoFirePoint
          : geoFirePoint as GeoFirePoint,
      placemark:
          placemark == freezed ? _value.placemark : placemark as Placemark,
    ));
  }
}

@Implements(IEntity)
class _$_LocationDomain extends _LocationDomain {
  const _$_LocationDomain(
      {@required this.id,
      @required this.locationData,
      @required this.geoFirePoint,
      @required this.placemark})
      : assert(id != null),
        assert(locationData != null),
        assert(geoFirePoint != null),
        assert(placemark != null),
        super._();

  @override
  final UniqueId id;
  @override
  final LocationData locationData;
  @override
  final GeoFirePoint geoFirePoint;
  @override
  final Placemark placemark;

  @override
  String toString() {
    return 'LocationDomain(id: $id, locationData: $locationData, geoFirePoint: $geoFirePoint, placemark: $placemark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocationDomain &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.locationData, locationData) ||
                const DeepCollectionEquality()
                    .equals(other.locationData, locationData)) &&
            (identical(other.geoFirePoint, geoFirePoint) ||
                const DeepCollectionEquality()
                    .equals(other.geoFirePoint, geoFirePoint)) &&
            (identical(other.placemark, placemark) ||
                const DeepCollectionEquality()
                    .equals(other.placemark, placemark)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(locationData) ^
      const DeepCollectionEquality().hash(geoFirePoint) ^
      const DeepCollectionEquality().hash(placemark);

  @override
  _$LocationDomainCopyWith<_LocationDomain> get copyWith =>
      __$LocationDomainCopyWithImpl<_LocationDomain>(this, _$identity);
}

abstract class _LocationDomain extends LocationDomain implements IEntity {
  const _LocationDomain._() : super._();
  const factory _LocationDomain(
      {@required UniqueId id,
      @required LocationData locationData,
      @required GeoFirePoint geoFirePoint,
      @required Placemark placemark}) = _$_LocationDomain;

  @override
  UniqueId get id;
  @override
  LocationData get locationData;
  @override
  GeoFirePoint get geoFirePoint;
  @override
  Placemark get placemark;
  @override
  _$LocationDomainCopyWith<_LocationDomain> get copyWith;
}
