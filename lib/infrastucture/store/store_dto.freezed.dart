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
      @required @JsonKey(defaultValue: '') String name,
      @required @JsonKey(defaultValue: '') String menu,
      @required @JsonKey(defaultValue: '') String banner,
      @required @JsonKey(defaultValue: []) List<String> pics,
      @required @JsonKey(defaultValue: '') String ownerId,
      @required StoreLocationDto location,
      @required StorePrefsDto prefs,
      @required @ServerTimestampConverter() FieldValue serverTimeStamp,
      @required @JsonKey(defaultValue: {}) Map<String, bool> blockedUsers}) {
    return _StoreDto(
      id: id,
      name: name,
      menu: menu,
      banner: banner,
      pics: pics,
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
  @JsonKey(defaultValue: '')
  String get name;
  @JsonKey(defaultValue: '')
  String get menu;
  @JsonKey(defaultValue: '')
  String get banner;
  @JsonKey(defaultValue: [])
  List<String> get pics;
  @JsonKey(defaultValue: '')
  String get ownerId;
  StoreLocationDto get location;
  StorePrefsDto get prefs;
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @JsonKey(defaultValue: {})
  Map<String, bool> get blockedUsers;

  Map<String, dynamic> toJson();
  $StoreDtoCopyWith<StoreDto> get copyWith;
}

abstract class $StoreDtoCopyWith<$Res> {
  factory $StoreDtoCopyWith(StoreDto value, $Res Function(StoreDto) then) =
      _$StoreDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(defaultValue: '') String name,
      @JsonKey(defaultValue: '') String menu,
      @JsonKey(defaultValue: '') String banner,
      @JsonKey(defaultValue: []) List<String> pics,
      @JsonKey(defaultValue: '') String ownerId,
      StoreLocationDto location,
      StorePrefsDto prefs,
      @ServerTimestampConverter() FieldValue serverTimeStamp,
      @JsonKey(defaultValue: {}) Map<String, bool> blockedUsers});

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
    Object banner = freezed,
    Object pics = freezed,
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
      banner: banner == freezed ? _value.banner : banner as String,
      pics: pics == freezed ? _value.pics : pics as List<String>,
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
      @JsonKey(defaultValue: '') String name,
      @JsonKey(defaultValue: '') String menu,
      @JsonKey(defaultValue: '') String banner,
      @JsonKey(defaultValue: []) List<String> pics,
      @JsonKey(defaultValue: '') String ownerId,
      StoreLocationDto location,
      StorePrefsDto prefs,
      @ServerTimestampConverter() FieldValue serverTimeStamp,
      @JsonKey(defaultValue: {}) Map<String, bool> blockedUsers});

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
    Object banner = freezed,
    Object pics = freezed,
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
      banner: banner == freezed ? _value.banner : banner as String,
      pics: pics == freezed ? _value.pics : pics as List<String>,
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
      @required @JsonKey(defaultValue: '') this.name,
      @required @JsonKey(defaultValue: '') this.menu,
      @required @JsonKey(defaultValue: '') this.banner,
      @required @JsonKey(defaultValue: []) this.pics,
      @required @JsonKey(defaultValue: '') this.ownerId,
      @required this.location,
      @required this.prefs,
      @required @ServerTimestampConverter() this.serverTimeStamp,
      @required @JsonKey(defaultValue: {}) this.blockedUsers})
      : assert(name != null),
        assert(menu != null),
        assert(banner != null),
        assert(pics != null),
        assert(ownerId != null),
        assert(location != null),
        assert(prefs != null),
        assert(serverTimeStamp != null),
        assert(blockedUsers != null),
        super._();

  factory _$_StoreDto.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  @JsonKey(defaultValue: '')
  final String name;
  @override
  @JsonKey(defaultValue: '')
  final String menu;
  @override
  @JsonKey(defaultValue: '')
  final String banner;
  @override
  @JsonKey(defaultValue: [])
  final List<String> pics;
  @override
  @JsonKey(defaultValue: '')
  final String ownerId;
  @override
  final StoreLocationDto location;
  @override
  final StorePrefsDto prefs;
  @override
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;
  @override
  @JsonKey(defaultValue: {})
  final Map<String, bool> blockedUsers;

  @override
  String toString() {
    return 'StoreDto(id: $id, name: $name, menu: $menu, banner: $banner, pics: $pics, ownerId: $ownerId, location: $location, prefs: $prefs, serverTimeStamp: $serverTimeStamp, blockedUsers: $blockedUsers)';
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
            (identical(other.banner, banner) ||
                const DeepCollectionEquality().equals(other.banner, banner)) &&
            (identical(other.pics, pics) ||
                const DeepCollectionEquality().equals(other.pics, pics)) &&
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
      const DeepCollectionEquality().hash(banner) ^
      const DeepCollectionEquality().hash(pics) ^
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
      @JsonKey(defaultValue: '')
          String name,
      @required
      @JsonKey(defaultValue: '')
          String menu,
      @required
      @JsonKey(defaultValue: '')
          String banner,
      @required
      @JsonKey(defaultValue: [])
          List<String> pics,
      @required
      @JsonKey(defaultValue: '')
          String ownerId,
      @required
          StoreLocationDto location,
      @required
          StorePrefsDto prefs,
      @required
      @ServerTimestampConverter()
          FieldValue serverTimeStamp,
      @required
      @JsonKey(defaultValue: {})
          Map<String, bool> blockedUsers}) = _$_StoreDto;

  factory _StoreDto.fromJson(Map<String, dynamic> json) = _$_StoreDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  @JsonKey(defaultValue: '')
  String get name;
  @override
  @JsonKey(defaultValue: '')
  String get menu;
  @override
  @JsonKey(defaultValue: '')
  String get banner;
  @override
  @JsonKey(defaultValue: [])
  List<String> get pics;
  @override
  @JsonKey(defaultValue: '')
  String get ownerId;
  @override
  StoreLocationDto get location;
  @override
  StorePrefsDto get prefs;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(defaultValue: {})
  Map<String, bool> get blockedUsers;
  @override
  _$StoreDtoCopyWith<_StoreDto> get copyWith;
}
