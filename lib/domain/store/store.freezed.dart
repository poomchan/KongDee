// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

class _$StoreTearOff {
  const _$StoreTearOff();

// ignore: unused_element
  _Store call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) bool isOwner,
      @required @JsonKey(defaultValue: '') String ownerId,
      @required @JsonKey(defaultValue: '') String name,
      @required @JsonKey(defaultValue: '') String banner,
      @required @JsonKey(defaultValue: '') String menu,
      @required @JsonKey(defaultValue: []) List<String> pics,
      @required @JsonKey(defaultValue: {}) Map<String, bool> blockedUsers,
      @required StoreLocation location,
      @required StorePrefs prefs}) {
    return _Store(
      id: id,
      isOwner: isOwner,
      ownerId: ownerId,
      name: name,
      banner: banner,
      menu: menu,
      pics: pics,
      blockedUsers: blockedUsers,
      location: location,
      prefs: prefs,
    );
  }
}

// ignore: unused_element
const $Store = _$StoreTearOff();

mixin _$Store {
  @JsonKey(ignore: true)
  String get id;
  @JsonKey(ignore: true)
  bool get isOwner;
  @JsonKey(defaultValue: '')
  String get ownerId;
  @JsonKey(defaultValue: '')
  String get name;
  @JsonKey(defaultValue: '')
  String get banner;
  @JsonKey(defaultValue: '')
  String get menu;
  @JsonKey(defaultValue: [])
  List<String> get pics;
  @JsonKey(defaultValue: {})
  Map<String, bool> get blockedUsers;
  StoreLocation get location;
  StorePrefs get prefs;

  Map<String, dynamic> toJson();
  $StoreCopyWith<Store> get copyWith;
}

abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) bool isOwner,
      @JsonKey(defaultValue: '') String ownerId,
      @JsonKey(defaultValue: '') String name,
      @JsonKey(defaultValue: '') String banner,
      @JsonKey(defaultValue: '') String menu,
      @JsonKey(defaultValue: []) List<String> pics,
      @JsonKey(defaultValue: {}) Map<String, bool> blockedUsers,
      StoreLocation location,
      StorePrefs prefs});

  $StoreLocationCopyWith<$Res> get location;
  $StorePrefsCopyWith<$Res> get prefs;
}

class _$StoreCopyWithImpl<$Res> implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  final Store _value;
  // ignore: unused_field
  final $Res Function(Store) _then;

  @override
  $Res call({
    Object id = freezed,
    Object isOwner = freezed,
    Object ownerId = freezed,
    Object name = freezed,
    Object banner = freezed,
    Object menu = freezed,
    Object pics = freezed,
    Object blockedUsers = freezed,
    Object location = freezed,
    Object prefs = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as String,
      name: name == freezed ? _value.name : name as String,
      banner: banner == freezed ? _value.banner : banner as String,
      menu: menu == freezed ? _value.menu : menu as String,
      pics: pics == freezed ? _value.pics : pics as List<String>,
      blockedUsers: blockedUsers == freezed
          ? _value.blockedUsers
          : blockedUsers as Map<String, bool>,
      location:
          location == freezed ? _value.location : location as StoreLocation,
      prefs: prefs == freezed ? _value.prefs : prefs as StorePrefs,
    ));
  }

  @override
  $StoreLocationCopyWith<$Res> get location {
    if (_value.location == null) {
      return null;
    }
    return $StoreLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $StorePrefsCopyWith<$Res> get prefs {
    if (_value.prefs == null) {
      return null;
    }
    return $StorePrefsCopyWith<$Res>(_value.prefs, (value) {
      return _then(_value.copyWith(prefs: value));
    });
  }
}

abstract class _$StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) then) =
      __$StoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) bool isOwner,
      @JsonKey(defaultValue: '') String ownerId,
      @JsonKey(defaultValue: '') String name,
      @JsonKey(defaultValue: '') String banner,
      @JsonKey(defaultValue: '') String menu,
      @JsonKey(defaultValue: []) List<String> pics,
      @JsonKey(defaultValue: {}) Map<String, bool> blockedUsers,
      StoreLocation location,
      StorePrefs prefs});

  @override
  $StoreLocationCopyWith<$Res> get location;
  @override
  $StorePrefsCopyWith<$Res> get prefs;
}

class __$StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(_Store _value, $Res Function(_Store) _then)
      : super(_value, (v) => _then(v as _Store));

  @override
  _Store get _value => super._value as _Store;

  @override
  $Res call({
    Object id = freezed,
    Object isOwner = freezed,
    Object ownerId = freezed,
    Object name = freezed,
    Object banner = freezed,
    Object menu = freezed,
    Object pics = freezed,
    Object blockedUsers = freezed,
    Object location = freezed,
    Object prefs = freezed,
  }) {
    return _then(_Store(
      id: id == freezed ? _value.id : id as String,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as String,
      name: name == freezed ? _value.name : name as String,
      banner: banner == freezed ? _value.banner : banner as String,
      menu: menu == freezed ? _value.menu : menu as String,
      pics: pics == freezed ? _value.pics : pics as List<String>,
      blockedUsers: blockedUsers == freezed
          ? _value.blockedUsers
          : blockedUsers as Map<String, bool>,
      location:
          location == freezed ? _value.location : location as StoreLocation,
      prefs: prefs == freezed ? _value.prefs : prefs as StorePrefs,
    ));
  }
}

@JsonSerializable()
class _$_Store extends _Store {
  const _$_Store(
      {@JsonKey(ignore: true) this.id,
      @JsonKey(ignore: true) this.isOwner,
      @required @JsonKey(defaultValue: '') this.ownerId,
      @required @JsonKey(defaultValue: '') this.name,
      @required @JsonKey(defaultValue: '') this.banner,
      @required @JsonKey(defaultValue: '') this.menu,
      @required @JsonKey(defaultValue: []) this.pics,
      @required @JsonKey(defaultValue: {}) this.blockedUsers,
      @required this.location,
      @required this.prefs})
      : assert(ownerId != null),
        assert(name != null),
        assert(banner != null),
        assert(menu != null),
        assert(pics != null),
        assert(blockedUsers != null),
        assert(location != null),
        assert(prefs != null),
        super._();

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  @JsonKey(ignore: true)
  final bool isOwner;
  @override
  @JsonKey(defaultValue: '')
  final String ownerId;
  @override
  @JsonKey(defaultValue: '')
  final String name;
  @override
  @JsonKey(defaultValue: '')
  final String banner;
  @override
  @JsonKey(defaultValue: '')
  final String menu;
  @override
  @JsonKey(defaultValue: [])
  final List<String> pics;
  @override
  @JsonKey(defaultValue: {})
  final Map<String, bool> blockedUsers;
  @override
  final StoreLocation location;
  @override
  final StorePrefs prefs;

  @override
  String toString() {
    return 'Store(id: $id, isOwner: $isOwner, ownerId: $ownerId, name: $name, banner: $banner, menu: $menu, pics: $pics, blockedUsers: $blockedUsers, location: $location, prefs: $prefs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Store &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isOwner, isOwner) ||
                const DeepCollectionEquality()
                    .equals(other.isOwner, isOwner)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.banner, banner) ||
                const DeepCollectionEquality().equals(other.banner, banner)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)) &&
            (identical(other.pics, pics) ||
                const DeepCollectionEquality().equals(other.pics, pics)) &&
            (identical(other.blockedUsers, blockedUsers) ||
                const DeepCollectionEquality()
                    .equals(other.blockedUsers, blockedUsers)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.prefs, prefs) ||
                const DeepCollectionEquality().equals(other.prefs, prefs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isOwner) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(banner) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(pics) ^
      const DeepCollectionEquality().hash(blockedUsers) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(prefs);

  @override
  _$StoreCopyWith<_Store> get copyWith =>
      __$StoreCopyWithImpl<_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreToJson(this);
  }
}

abstract class _Store extends Store {
  const _Store._() : super._();
  const factory _Store(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) bool isOwner,
      @required @JsonKey(defaultValue: '') String ownerId,
      @required @JsonKey(defaultValue: '') String name,
      @required @JsonKey(defaultValue: '') String banner,
      @required @JsonKey(defaultValue: '') String menu,
      @required @JsonKey(defaultValue: []) List<String> pics,
      @required @JsonKey(defaultValue: {}) Map<String, bool> blockedUsers,
      @required StoreLocation location,
      @required StorePrefs prefs}) = _$_Store;

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  @JsonKey(ignore: true)
  bool get isOwner;
  @override
  @JsonKey(defaultValue: '')
  String get ownerId;
  @override
  @JsonKey(defaultValue: '')
  String get name;
  @override
  @JsonKey(defaultValue: '')
  String get banner;
  @override
  @JsonKey(defaultValue: '')
  String get menu;
  @override
  @JsonKey(defaultValue: [])
  List<String> get pics;
  @override
  @JsonKey(defaultValue: {})
  Map<String, bool> get blockedUsers;
  @override
  StoreLocation get location;
  @override
  StorePrefs get prefs;
  @override
  _$StoreCopyWith<_Store> get copyWith;
}
