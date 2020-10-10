// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StoreDto _$StoreDtoFromJson(Map<String, dynamic> json) {
  return _StoreDto.fromJson(json);
}

class _$StoreDtoTearOff {
  const _$StoreDtoTearOff();

// ignore: unused_element
  _StoreDto call(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required String menu,
      @required String bannerUrl,
      @required List<String> picUrls,
      @required String ownerId,
      @required int distanceAway,
      @required String formattedAddress,
      @required @ServerTimestampConverter() FieldValue serverTimeStamp,
      @JsonKey(ignore: true) GeoPoint geoPoint}) {
    return _StoreDto(
      id: id,
      name: name,
      menu: menu,
      bannerUrl: bannerUrl,
      picUrls: picUrls,
      ownerId: ownerId,
      distanceAway: distanceAway,
      formattedAddress: formattedAddress,
      serverTimeStamp: serverTimeStamp,
      geoPoint: geoPoint,
    );
  }
}

// ignore: unused_element
const $StoreDto = _$StoreDtoTearOff();

mixin _$StoreDto {
  @JsonKey(ignore: true)
  String get id;
  String get name;
  String get menu;
  String get bannerUrl;
  List<String> get picUrls;
  String get ownerId;
  int get distanceAway;
  String get formattedAddress;
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @JsonKey(ignore: true)
  GeoPoint get geoPoint;

  Map<String, dynamic> toJson();
  $StoreDtoCopyWith<StoreDto> get copyWith;
}

abstract class $StoreDtoCopyWith<$Res> {
  factory $StoreDtoCopyWith(StoreDto value, $Res Function(StoreDto) then) =
      _$StoreDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      String menu,
      String bannerUrl,
      List<String> picUrls,
      String ownerId,
      int distanceAway,
      String formattedAddress,
      @ServerTimestampConverter() FieldValue serverTimeStamp,
      @JsonKey(ignore: true) GeoPoint geoPoint});
}

class _$StoreDtoCopyWithImpl<$Res> implements $StoreDtoCopyWith<$Res> {
  _$StoreDtoCopyWithImpl(this._value, this._then);

  final StoreDto _value;
  // ignore: unused_field
  final $Res Function(StoreDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object menu = freezed,
    Object bannerUrl = freezed,
    Object picUrls = freezed,
    Object ownerId = freezed,
    Object distanceAway = freezed,
    Object formattedAddress = freezed,
    Object serverTimeStamp = freezed,
    Object geoPoint = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      menu: menu == freezed ? _value.menu : menu as String,
      bannerUrl: bannerUrl == freezed ? _value.bannerUrl : bannerUrl as String,
      picUrls: picUrls == freezed ? _value.picUrls : picUrls as List<String>,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as String,
      distanceAway:
          distanceAway == freezed ? _value.distanceAway : distanceAway as int,
      formattedAddress: formattedAddress == freezed
          ? _value.formattedAddress
          : formattedAddress as String,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
      geoPoint: geoPoint == freezed ? _value.geoPoint : geoPoint as GeoPoint,
    ));
  }
}

abstract class _$StoreDtoCopyWith<$Res> implements $StoreDtoCopyWith<$Res> {
  factory _$StoreDtoCopyWith(_StoreDto value, $Res Function(_StoreDto) then) =
      __$StoreDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String name,
      String menu,
      String bannerUrl,
      List<String> picUrls,
      String ownerId,
      int distanceAway,
      String formattedAddress,
      @ServerTimestampConverter() FieldValue serverTimeStamp,
      @JsonKey(ignore: true) GeoPoint geoPoint});
}

class __$StoreDtoCopyWithImpl<$Res> extends _$StoreDtoCopyWithImpl<$Res>
    implements _$StoreDtoCopyWith<$Res> {
  __$StoreDtoCopyWithImpl(_StoreDto _value, $Res Function(_StoreDto) _then)
      : super(_value, (v) => _then(v as _StoreDto));

  @override
  _StoreDto get _value => super._value as _StoreDto;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object menu = freezed,
    Object bannerUrl = freezed,
    Object picUrls = freezed,
    Object ownerId = freezed,
    Object distanceAway = freezed,
    Object formattedAddress = freezed,
    Object serverTimeStamp = freezed,
    Object geoPoint = freezed,
  }) {
    return _then(_StoreDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      menu: menu == freezed ? _value.menu : menu as String,
      bannerUrl: bannerUrl == freezed ? _value.bannerUrl : bannerUrl as String,
      picUrls: picUrls == freezed ? _value.picUrls : picUrls as List<String>,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as String,
      distanceAway:
          distanceAway == freezed ? _value.distanceAway : distanceAway as int,
      formattedAddress: formattedAddress == freezed
          ? _value.formattedAddress
          : formattedAddress as String,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
      geoPoint: geoPoint == freezed ? _value.geoPoint : geoPoint as GeoPoint,
    ));
  }
}

@JsonSerializable()
class _$_StoreDto extends _StoreDto {
  const _$_StoreDto(
      {@JsonKey(ignore: true) this.id,
      @required this.name,
      @required this.menu,
      @required this.bannerUrl,
      @required this.picUrls,
      @required this.ownerId,
      @required this.distanceAway,
      @required this.formattedAddress,
      @required @ServerTimestampConverter() this.serverTimeStamp,
      @JsonKey(ignore: true) this.geoPoint})
      : assert(name != null),
        assert(menu != null),
        assert(bannerUrl != null),
        assert(picUrls != null),
        assert(ownerId != null),
        assert(distanceAway != null),
        assert(formattedAddress != null),
        assert(serverTimeStamp != null),
        super._();

  factory _$_StoreDto.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String name;
  @override
  final String menu;
  @override
  final String bannerUrl;
  @override
  final List<String> picUrls;
  @override
  final String ownerId;
  @override
  final int distanceAway;
  @override
  final String formattedAddress;
  @override
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  final GeoPoint geoPoint;

  @override
  String toString() {
    return 'StoreDto(id: $id, name: $name, menu: $menu, bannerUrl: $bannerUrl, picUrls: $picUrls, ownerId: $ownerId, distanceAway: $distanceAway, formattedAddress: $formattedAddress, serverTimeStamp: $serverTimeStamp, geoPoint: $geoPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)) &&
            (identical(other.bannerUrl, bannerUrl) ||
                const DeepCollectionEquality()
                    .equals(other.bannerUrl, bannerUrl)) &&
            (identical(other.picUrls, picUrls) ||
                const DeepCollectionEquality()
                    .equals(other.picUrls, picUrls)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.distanceAway, distanceAway) ||
                const DeepCollectionEquality()
                    .equals(other.distanceAway, distanceAway)) &&
            (identical(other.formattedAddress, formattedAddress) ||
                const DeepCollectionEquality()
                    .equals(other.formattedAddress, formattedAddress)) &&
            (identical(other.serverTimeStamp, serverTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.serverTimeStamp, serverTimeStamp)) &&
            (identical(other.geoPoint, geoPoint) ||
                const DeepCollectionEquality()
                    .equals(other.geoPoint, geoPoint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(bannerUrl) ^
      const DeepCollectionEquality().hash(picUrls) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(distanceAway) ^
      const DeepCollectionEquality().hash(formattedAddress) ^
      const DeepCollectionEquality().hash(serverTimeStamp) ^
      const DeepCollectionEquality().hash(geoPoint);

  @override
  _$StoreDtoCopyWith<_StoreDto> get copyWith =>
      __$StoreDtoCopyWithImpl<_StoreDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreDtoToJson(this);
  }
}

abstract class _StoreDto extends StoreDto {
  const _StoreDto._() : super._();
  const factory _StoreDto(
      {@JsonKey(ignore: true) String id,
      @required String name,
      @required String menu,
      @required String bannerUrl,
      @required List<String> picUrls,
      @required String ownerId,
      @required int distanceAway,
      @required String formattedAddress,
      @required @ServerTimestampConverter() FieldValue serverTimeStamp,
      @JsonKey(ignore: true) GeoPoint geoPoint}) = _$_StoreDto;

  factory _StoreDto.fromJson(Map<String, dynamic> json) = _$_StoreDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get name;
  @override
  String get menu;
  @override
  String get bannerUrl;
  @override
  List<String> get picUrls;
  @override
  String get ownerId;
  @override
  int get distanceAway;
  @override
  String get formattedAddress;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  GeoPoint get geoPoint;
  @override
  _$StoreDtoCopyWith<_StoreDto> get copyWith;
}
