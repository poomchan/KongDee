// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_location_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StoreLocationDto _$StoreLocationDtoFromJson(Map<String, dynamic> json) {
  return _StoreLocationDto.fromJson(json);
}

class _$StoreLocationDtoTearOff {
  const _$StoreLocationDtoTearOff();

// ignore: unused_element
  _StoreLocationDto call(
      {@required @nullable String address,
      @GeoFirePointConverter() GeoFirePoint geoFirePoint}) {
    return _StoreLocationDto(
      address: address,
      geoFirePoint: geoFirePoint,
    );
  }
}

// ignore: unused_element
const $StoreLocationDto = _$StoreLocationDtoTearOff();

mixin _$StoreLocationDto {
  @nullable
  String get address;
  @GeoFirePointConverter()
  GeoFirePoint get geoFirePoint;

  Map<String, dynamic> toJson();
  $StoreLocationDtoCopyWith<StoreLocationDto> get copyWith;
}

abstract class $StoreLocationDtoCopyWith<$Res> {
  factory $StoreLocationDtoCopyWith(
          StoreLocationDto value, $Res Function(StoreLocationDto) then) =
      _$StoreLocationDtoCopyWithImpl<$Res>;
  $Res call(
      {@nullable String address,
      @GeoFirePointConverter() GeoFirePoint geoFirePoint});
}

class _$StoreLocationDtoCopyWithImpl<$Res>
    implements $StoreLocationDtoCopyWith<$Res> {
  _$StoreLocationDtoCopyWithImpl(this._value, this._then);

  final StoreLocationDto _value;
  // ignore: unused_field
  final $Res Function(StoreLocationDto) _then;

  @override
  $Res call({
    Object address = freezed,
    Object geoFirePoint = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed ? _value.address : address as String,
      geoFirePoint: geoFirePoint == freezed
          ? _value.geoFirePoint
          : geoFirePoint as GeoFirePoint,
    ));
  }
}

abstract class _$StoreLocationDtoCopyWith<$Res>
    implements $StoreLocationDtoCopyWith<$Res> {
  factory _$StoreLocationDtoCopyWith(
          _StoreLocationDto value, $Res Function(_StoreLocationDto) then) =
      __$StoreLocationDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String address,
      @GeoFirePointConverter() GeoFirePoint geoFirePoint});
}

class __$StoreLocationDtoCopyWithImpl<$Res>
    extends _$StoreLocationDtoCopyWithImpl<$Res>
    implements _$StoreLocationDtoCopyWith<$Res> {
  __$StoreLocationDtoCopyWithImpl(
      _StoreLocationDto _value, $Res Function(_StoreLocationDto) _then)
      : super(_value, (v) => _then(v as _StoreLocationDto));

  @override
  _StoreLocationDto get _value => super._value as _StoreLocationDto;

  @override
  $Res call({
    Object address = freezed,
    Object geoFirePoint = freezed,
  }) {
    return _then(_StoreLocationDto(
      address: address == freezed ? _value.address : address as String,
      geoFirePoint: geoFirePoint == freezed
          ? _value.geoFirePoint
          : geoFirePoint as GeoFirePoint,
    ));
  }
}

@JsonSerializable()
class _$_StoreLocationDto extends _StoreLocationDto {
  const _$_StoreLocationDto(
      {@required @nullable this.address,
      @GeoFirePointConverter() this.geoFirePoint})
      : super._();

  factory _$_StoreLocationDto.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreLocationDtoFromJson(json);

  @override
  @nullable
  final String address;
  @override
  @GeoFirePointConverter()
  final GeoFirePoint geoFirePoint;

  @override
  String toString() {
    return 'StoreLocationDto(address: $address, geoFirePoint: $geoFirePoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreLocationDto &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.geoFirePoint, geoFirePoint) ||
                const DeepCollectionEquality()
                    .equals(other.geoFirePoint, geoFirePoint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(geoFirePoint);

  @override
  _$StoreLocationDtoCopyWith<_StoreLocationDto> get copyWith =>
      __$StoreLocationDtoCopyWithImpl<_StoreLocationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreLocationDtoToJson(this);
  }
}

abstract class _StoreLocationDto extends StoreLocationDto {
  const _StoreLocationDto._() : super._();
  const factory _StoreLocationDto(
          {@required @nullable String address,
          @GeoFirePointConverter() GeoFirePoint geoFirePoint}) =
      _$_StoreLocationDto;

  factory _StoreLocationDto.fromJson(Map<String, dynamic> json) =
      _$_StoreLocationDto.fromJson;

  @override
  @nullable
  String get address;
  @override
  @GeoFirePointConverter()
  GeoFirePoint get geoFirePoint;
  @override
  _$StoreLocationDtoCopyWith<_StoreLocationDto> get copyWith;
}
