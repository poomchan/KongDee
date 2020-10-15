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
      {@required String fullAddress,
      @required String formattedAddress,
      @required GeoFirePoint geoFirePoint,
      @required LocationData position}) {
    return _LocationDomain(
      fullAddress: fullAddress,
      formattedAddress: formattedAddress,
      geoFirePoint: geoFirePoint,
      position: position,
    );
  }
}

// ignore: unused_element
const $LocationDomain = _$LocationDomainTearOff();

mixin _$LocationDomain {
  String get fullAddress;
  String get formattedAddress;
  GeoFirePoint get geoFirePoint;
  LocationData get position;

  $LocationDomainCopyWith<LocationDomain> get copyWith;
}

abstract class $LocationDomainCopyWith<$Res> {
  factory $LocationDomainCopyWith(
          LocationDomain value, $Res Function(LocationDomain) then) =
      _$LocationDomainCopyWithImpl<$Res>;
  $Res call(
      {String fullAddress,
      String formattedAddress,
      GeoFirePoint geoFirePoint,
      LocationData position});
}

class _$LocationDomainCopyWithImpl<$Res>
    implements $LocationDomainCopyWith<$Res> {
  _$LocationDomainCopyWithImpl(this._value, this._then);

  final LocationDomain _value;
  // ignore: unused_field
  final $Res Function(LocationDomain) _then;

  @override
  $Res call({
    Object fullAddress = freezed,
    Object formattedAddress = freezed,
    Object geoFirePoint = freezed,
    Object position = freezed,
  }) {
    return _then(_value.copyWith(
      fullAddress:
          fullAddress == freezed ? _value.fullAddress : fullAddress as String,
      formattedAddress: formattedAddress == freezed
          ? _value.formattedAddress
          : formattedAddress as String,
      geoFirePoint: geoFirePoint == freezed
          ? _value.geoFirePoint
          : geoFirePoint as GeoFirePoint,
      position:
          position == freezed ? _value.position : position as LocationData,
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
      {String fullAddress,
      String formattedAddress,
      GeoFirePoint geoFirePoint,
      LocationData position});
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
    Object fullAddress = freezed,
    Object formattedAddress = freezed,
    Object geoFirePoint = freezed,
    Object position = freezed,
  }) {
    return _then(_LocationDomain(
      fullAddress:
          fullAddress == freezed ? _value.fullAddress : fullAddress as String,
      formattedAddress: formattedAddress == freezed
          ? _value.formattedAddress
          : formattedAddress as String,
      geoFirePoint: geoFirePoint == freezed
          ? _value.geoFirePoint
          : geoFirePoint as GeoFirePoint,
      position:
          position == freezed ? _value.position : position as LocationData,
    ));
  }
}

class _$_LocationDomain implements _LocationDomain {
  const _$_LocationDomain(
      {@required this.fullAddress,
      @required this.formattedAddress,
      @required this.geoFirePoint,
      @required this.position})
      : assert(fullAddress != null),
        assert(formattedAddress != null),
        assert(geoFirePoint != null),
        assert(position != null);

  @override
  final String fullAddress;
  @override
  final String formattedAddress;
  @override
  final GeoFirePoint geoFirePoint;
  @override
  final LocationData position;

  @override
  String toString() {
    return 'LocationDomain(fullAddress: $fullAddress, formattedAddress: $formattedAddress, geoFirePoint: $geoFirePoint, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocationDomain &&
            (identical(other.fullAddress, fullAddress) ||
                const DeepCollectionEquality()
                    .equals(other.fullAddress, fullAddress)) &&
            (identical(other.formattedAddress, formattedAddress) ||
                const DeepCollectionEquality()
                    .equals(other.formattedAddress, formattedAddress)) &&
            (identical(other.geoFirePoint, geoFirePoint) ||
                const DeepCollectionEquality()
                    .equals(other.geoFirePoint, geoFirePoint)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fullAddress) ^
      const DeepCollectionEquality().hash(formattedAddress) ^
      const DeepCollectionEquality().hash(geoFirePoint) ^
      const DeepCollectionEquality().hash(position);

  @override
  _$LocationDomainCopyWith<_LocationDomain> get copyWith =>
      __$LocationDomainCopyWithImpl<_LocationDomain>(this, _$identity);
}

abstract class _LocationDomain implements LocationDomain {
  const factory _LocationDomain(
      {@required String fullAddress,
      @required String formattedAddress,
      @required GeoFirePoint geoFirePoint,
      @required LocationData position}) = _$_LocationDomain;

  @override
  String get fullAddress;
  @override
  String get formattedAddress;
  @override
  GeoFirePoint get geoFirePoint;
  @override
  LocationData get position;
  @override
  _$LocationDomainCopyWith<_LocationDomain> get copyWith;
}
