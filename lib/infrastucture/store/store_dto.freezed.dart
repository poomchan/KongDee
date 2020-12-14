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
      {@JsonKey(ignore: true)
          String id,
      @required
      @nullable
          String name,
      @required
      @nullable
          String menu,
      @required
      @nullable
          String bannerUrl,
      @required
      @nullable
          List<String> picUrls,
      @required
      @nullable
          String ownerId,
      @required
      @nullable
          StoreLocationDto location,
      @required
      @nullable
          StorePrefsDto prefs,
      @required
      @nullable
      @ServerTimestampConverter()
          FieldValue serverTimeStamp,
      @required
      @nullable
          Map<String, bool> blockedUsers}) {
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
      blockedUsers: blockedUsers,
    );
  }
}

// ignore: unused_element
const $StoreDto = _$StoreDtoTearOff();

mixin _$StoreDto {
  @JsonKey(ignore: true)
  String get id;
  @nullable
  String get name;
  @nullable
  String get menu;
  @nullable
  String get bannerUrl;
  @nullable
  List<String> get picUrls;
  @nullable
  String get ownerId;
  @nullable
  StoreLocationDto get location;
  @nullable
  StorePrefsDto get prefs;
  @nullable
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @nullable
  Map<String, bool> get blockedUsers;

  Map<String, dynamic> toJson();
  $StoreDtoCopyWith<StoreDto> get copyWith;
}

abstract class $StoreDtoCopyWith<$Res> {
  factory $StoreDtoCopyWith(StoreDto value, $Res Function(StoreDto) then) =
      _$StoreDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      @nullable String name,
      @nullable String menu,
      @nullable String bannerUrl,
      @nullable List<String> picUrls,
      @nullable String ownerId,
      @nullable StoreLocationDto location,
      @nullable StorePrefsDto prefs,
      @nullable @ServerTimestampConverter() FieldValue serverTimeStamp,
      @nullable Map<String, bool> blockedUsers});

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
    Object blockedUsers = freezed,
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
      blockedUsers: blockedUsers == freezed
          ? _value.blockedUsers
          : blockedUsers as Map<String, bool>,
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
      @nullable String name,
      @nullable String menu,
      @nullable String bannerUrl,
      @nullable List<String> picUrls,
      @nullable String ownerId,
      @nullable StoreLocationDto location,
      @nullable StorePrefsDto prefs,
      @nullable @ServerTimestampConverter() FieldValue serverTimeStamp,
      @nullable Map<String, bool> blockedUsers});

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
    Object blockedUsers = freezed,
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
      blockedUsers: blockedUsers == freezed
          ? _value.blockedUsers
          : blockedUsers as Map<String, bool>,
    ));
  }
}

@JsonSerializable()
class _$_StoreDto extends _StoreDto {
  const _$_StoreDto(
      {@JsonKey(ignore: true) this.id,
      @required @nullable this.name,
      @required @nullable this.menu,
      @required @nullable this.bannerUrl,
      @required @nullable this.picUrls,
      @required @nullable this.ownerId,
      @required @nullable this.location,
      @required @nullable this.prefs,
      @required @nullable @ServerTimestampConverter() this.serverTimeStamp,
      @required @nullable this.blockedUsers})
      : super._();

  factory _$_StoreDto.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  @nullable
  final String name;
  @override
  @nullable
  final String menu;
  @override
  @nullable
  final String bannerUrl;
  @override
  @nullable
  final List<String> picUrls;
  @override
  @nullable
  final String ownerId;
  @override
  @nullable
  final StoreLocationDto location;
  @override
  @nullable
  final StorePrefsDto prefs;
  @override
  @nullable
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;
  @override
  @nullable
  final Map<String, bool> blockedUsers;

  @override
  String toString() {
    return 'StoreDto(id: $id, name: $name, menu: $menu, bannerUrl: $bannerUrl, picUrls: $picUrls, ownerId: $ownerId, location: $location, prefs: $prefs, serverTimeStamp: $serverTimeStamp, blockedUsers: $blockedUsers)';
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
                    .equals(other.serverTimeStamp, serverTimeStamp)) &&
            (identical(other.blockedUsers, blockedUsers) ||
                const DeepCollectionEquality()
                    .equals(other.blockedUsers, blockedUsers)));
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
      const DeepCollectionEquality().hash(serverTimeStamp) ^
      const DeepCollectionEquality().hash(blockedUsers);

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
      {@JsonKey(ignore: true)
          String id,
      @required
      @nullable
          String name,
      @required
      @nullable
          String menu,
      @required
      @nullable
          String bannerUrl,
      @required
      @nullable
          List<String> picUrls,
      @required
      @nullable
          String ownerId,
      @required
      @nullable
          StoreLocationDto location,
      @required
      @nullable
          StorePrefsDto prefs,
      @required
      @nullable
      @ServerTimestampConverter()
          FieldValue serverTimeStamp,
      @required
      @nullable
          Map<String, bool> blockedUsers}) = _$_StoreDto;

  factory _StoreDto.fromJson(Map<String, dynamic> json) = _$_StoreDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  @nullable
  String get name;
  @override
  @nullable
  String get menu;
  @override
  @nullable
  String get bannerUrl;
  @override
  @nullable
  List<String> get picUrls;
  @override
  @nullable
  String get ownerId;
  @override
  @nullable
  StoreLocationDto get location;
  @override
  @nullable
  StorePrefsDto get prefs;
  @override
  @nullable
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  @nullable
  Map<String, bool> get blockedUsers;
  @override
  _$StoreDtoCopyWith<_StoreDto> get copyWith;
}
