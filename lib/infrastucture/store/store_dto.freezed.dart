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
      @required StoreLocationDto location,
      @required StorePrefsDto prefs,
      @required @ServerTimestampConverter() FieldValue serverTimeStamp}) {
    return _StoreDto(
      id: id,
      name: name,
      menu: menu,
      bannerUrl: bannerUrl,
      picUrls: picUrls,
      ownerId: ownerId,
      location: location,
      prefs: prefs,
      serverTimeStamp: serverTimeStamp,
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
  StoreLocationDto get location;
  StorePrefsDto get prefs;
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;

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
      StoreLocationDto location,
      StorePrefsDto prefs,
      @ServerTimestampConverter() FieldValue serverTimeStamp});

  $StoreLocationDtoCopyWith<$Res> get location;
  $StorePrefsDtoCopyWith<$Res> get prefs;
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
    Object location = freezed,
    Object prefs = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      menu: menu == freezed ? _value.menu : menu as String,
      bannerUrl: bannerUrl == freezed ? _value.bannerUrl : bannerUrl as String,
      picUrls: picUrls == freezed ? _value.picUrls : picUrls as List<String>,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as String,
      location:
          location == freezed ? _value.location : location as StoreLocationDto,
      prefs: prefs == freezed ? _value.prefs : prefs as StorePrefsDto,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }

  @override
  $StoreLocationDtoCopyWith<$Res> get location {
    if (_value.location == null) {
      return null;
    }
    return $StoreLocationDtoCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $StorePrefsDtoCopyWith<$Res> get prefs {
    if (_value.prefs == null) {
      return null;
    }
    return $StorePrefsDtoCopyWith<$Res>(_value.prefs, (value) {
      return _then(_value.copyWith(prefs: value));
    });
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
      StoreLocationDto location,
      StorePrefsDto prefs,
      @ServerTimestampConverter() FieldValue serverTimeStamp});

  @override
  $StoreLocationDtoCopyWith<$Res> get location;
  @override
  $StorePrefsDtoCopyWith<$Res> get prefs;
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
    Object location = freezed,
    Object prefs = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_StoreDto(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      menu: menu == freezed ? _value.menu : menu as String,
      bannerUrl: bannerUrl == freezed ? _value.bannerUrl : bannerUrl as String,
      picUrls: picUrls == freezed ? _value.picUrls : picUrls as List<String>,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as String,
      location:
          location == freezed ? _value.location : location as StoreLocationDto,
      prefs: prefs == freezed ? _value.prefs : prefs as StorePrefsDto,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
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
      @required this.location,
      @required this.prefs,
      @required @ServerTimestampConverter() this.serverTimeStamp})
      : assert(name != null),
        assert(menu != null),
        assert(bannerUrl != null),
        assert(picUrls != null),
        assert(ownerId != null),
        assert(location != null),
        assert(prefs != null),
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
  final StoreLocationDto location;
  @override
  final StorePrefsDto prefs;
  @override
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'StoreDto(id: $id, name: $name, menu: $menu, bannerUrl: $bannerUrl, picUrls: $picUrls, ownerId: $ownerId, location: $location, prefs: $prefs, serverTimeStamp: $serverTimeStamp)';
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
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.prefs, prefs) ||
                const DeepCollectionEquality().equals(other.prefs, prefs)) &&
            (identical(other.serverTimeStamp, serverTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.serverTimeStamp, serverTimeStamp)));
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
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(prefs) ^
      const DeepCollectionEquality().hash(serverTimeStamp);

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
          @required StoreLocationDto location,
          @required StorePrefsDto prefs,
          @required @ServerTimestampConverter() FieldValue serverTimeStamp}) =
      _$_StoreDto;

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
  StoreLocationDto get location;
  @override
  StorePrefsDto get prefs;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  _$StoreDtoCopyWith<_StoreDto> get copyWith;
}
