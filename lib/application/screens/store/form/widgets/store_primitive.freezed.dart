// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_primitive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StorePrimitiveTearOff {
  const _$StorePrimitiveTearOff();

// ignore: unused_element
  _StorePrimitive call(
      {@required UniqueId id,
      @required UniqueId ownerId,
      @required String name,
      @required String menu,
      @required Either<File, String> banner,
      @required List<Either<File, String>> pics,
      @required StorePrefs prefs,
      @required StoreLocation location,
      @required Map<String, bool> blockedUser}) {
    return _StorePrimitive(
      id: id,
      ownerId: ownerId,
      name: name,
      menu: menu,
      banner: banner,
      pics: pics,
      prefs: prefs,
      location: location,
      blockedUser: blockedUser,
    );
  }
}

// ignore: unused_element
const $StorePrimitive = _$StorePrimitiveTearOff();

mixin _$StorePrimitive {
  UniqueId get id;
  UniqueId get ownerId;
  String get name;
  String get menu;
  Either<File, String> get banner;
  List<Either<File, String>> get pics;
  StorePrefs get prefs;
  StoreLocation get location;
  Map<String, bool> get blockedUser;

  $StorePrimitiveCopyWith<StorePrimitive> get copyWith;
}

abstract class $StorePrimitiveCopyWith<$Res> {
  factory $StorePrimitiveCopyWith(
          StorePrimitive value, $Res Function(StorePrimitive) then) =
      _$StorePrimitiveCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      UniqueId ownerId,
      String name,
      String menu,
      Either<File, String> banner,
      List<Either<File, String>> pics,
      StorePrefs prefs,
      StoreLocation location,
      Map<String, bool> blockedUser});

  $StorePrefsCopyWith<$Res> get prefs;
  $StoreLocationCopyWith<$Res> get location;
}

class _$StorePrimitiveCopyWithImpl<$Res>
    implements $StorePrimitiveCopyWith<$Res> {
  _$StorePrimitiveCopyWithImpl(this._value, this._then);

  final StorePrimitive _value;
  // ignore: unused_field
  final $Res Function(StorePrimitive) _then;

  @override
  $Res call({
    Object id = freezed,
    Object ownerId = freezed,
    Object name = freezed,
    Object menu = freezed,
    Object banner = freezed,
    Object pics = freezed,
    Object prefs = freezed,
    Object location = freezed,
    Object blockedUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as UniqueId,
      name: name == freezed ? _value.name : name as String,
      menu: menu == freezed ? _value.menu : menu as String,
      banner:
          banner == freezed ? _value.banner : banner as Either<File, String>,
      pics: pics == freezed ? _value.pics : pics as List<Either<File, String>>,
      prefs: prefs == freezed ? _value.prefs : prefs as StorePrefs,
      location:
          location == freezed ? _value.location : location as StoreLocation,
      blockedUser: blockedUser == freezed
          ? _value.blockedUser
          : blockedUser as Map<String, bool>,
    ));
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

  @override
  $StoreLocationCopyWith<$Res> get location {
    if (_value.location == null) {
      return null;
    }
    return $StoreLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

abstract class _$StorePrimitiveCopyWith<$Res>
    implements $StorePrimitiveCopyWith<$Res> {
  factory _$StorePrimitiveCopyWith(
          _StorePrimitive value, $Res Function(_StorePrimitive) then) =
      __$StorePrimitiveCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      UniqueId ownerId,
      String name,
      String menu,
      Either<File, String> banner,
      List<Either<File, String>> pics,
      StorePrefs prefs,
      StoreLocation location,
      Map<String, bool> blockedUser});

  @override
  $StorePrefsCopyWith<$Res> get prefs;
  @override
  $StoreLocationCopyWith<$Res> get location;
}

class __$StorePrimitiveCopyWithImpl<$Res>
    extends _$StorePrimitiveCopyWithImpl<$Res>
    implements _$StorePrimitiveCopyWith<$Res> {
  __$StorePrimitiveCopyWithImpl(
      _StorePrimitive _value, $Res Function(_StorePrimitive) _then)
      : super(_value, (v) => _then(v as _StorePrimitive));

  @override
  _StorePrimitive get _value => super._value as _StorePrimitive;

  @override
  $Res call({
    Object id = freezed,
    Object ownerId = freezed,
    Object name = freezed,
    Object menu = freezed,
    Object banner = freezed,
    Object pics = freezed,
    Object prefs = freezed,
    Object location = freezed,
    Object blockedUser = freezed,
  }) {
    return _then(_StorePrimitive(
      id: id == freezed ? _value.id : id as UniqueId,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as UniqueId,
      name: name == freezed ? _value.name : name as String,
      menu: menu == freezed ? _value.menu : menu as String,
      banner:
          banner == freezed ? _value.banner : banner as Either<File, String>,
      pics: pics == freezed ? _value.pics : pics as List<Either<File, String>>,
      prefs: prefs == freezed ? _value.prefs : prefs as StorePrefs,
      location:
          location == freezed ? _value.location : location as StoreLocation,
      blockedUser: blockedUser == freezed
          ? _value.blockedUser
          : blockedUser as Map<String, bool>,
    ));
  }
}

class _$_StorePrimitive extends _StorePrimitive {
  const _$_StorePrimitive(
      {@required this.id,
      @required this.ownerId,
      @required this.name,
      @required this.menu,
      @required this.banner,
      @required this.pics,
      @required this.prefs,
      @required this.location,
      @required this.blockedUser})
      : assert(id != null),
        assert(ownerId != null),
        assert(name != null),
        assert(menu != null),
        assert(banner != null),
        assert(pics != null),
        assert(prefs != null),
        assert(location != null),
        assert(blockedUser != null),
        super._();

  @override
  final UniqueId id;
  @override
  final UniqueId ownerId;
  @override
  final String name;
  @override
  final String menu;
  @override
  final Either<File, String> banner;
  @override
  final List<Either<File, String>> pics;
  @override
  final StorePrefs prefs;
  @override
  final StoreLocation location;
  @override
  final Map<String, bool> blockedUser;

  @override
  String toString() {
    return 'StorePrimitive(id: $id, ownerId: $ownerId, name: $name, menu: $menu, banner: $banner, pics: $pics, prefs: $prefs, location: $location, blockedUser: $blockedUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StorePrimitive &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)) &&
            (identical(other.banner, banner) ||
                const DeepCollectionEquality().equals(other.banner, banner)) &&
            (identical(other.pics, pics) ||
                const DeepCollectionEquality().equals(other.pics, pics)) &&
            (identical(other.prefs, prefs) ||
                const DeepCollectionEquality().equals(other.prefs, prefs)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.blockedUser, blockedUser) ||
                const DeepCollectionEquality()
                    .equals(other.blockedUser, blockedUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(banner) ^
      const DeepCollectionEquality().hash(pics) ^
      const DeepCollectionEquality().hash(prefs) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(blockedUser);

  @override
  _$StorePrimitiveCopyWith<_StorePrimitive> get copyWith =>
      __$StorePrimitiveCopyWithImpl<_StorePrimitive>(this, _$identity);
}

abstract class _StorePrimitive extends StorePrimitive {
  const _StorePrimitive._() : super._();
  const factory _StorePrimitive(
      {@required UniqueId id,
      @required UniqueId ownerId,
      @required String name,
      @required String menu,
      @required Either<File, String> banner,
      @required List<Either<File, String>> pics,
      @required StorePrefs prefs,
      @required StoreLocation location,
      @required Map<String, bool> blockedUser}) = _$_StorePrimitive;

  @override
  UniqueId get id;
  @override
  UniqueId get ownerId;
  @override
  String get name;
  @override
  String get menu;
  @override
  Either<File, String> get banner;
  @override
  List<Either<File, String>> get pics;
  @override
  StorePrefs get prefs;
  @override
  StoreLocation get location;
  @override
  Map<String, bool> get blockedUser;
  @override
  _$StorePrimitiveCopyWith<_StorePrimitive> get copyWith;
}
