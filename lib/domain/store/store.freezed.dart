// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StoreTearOff {
  const _$StoreTearOff();

// ignore: unused_element
  _Store call(
      {@required UniqueId id,
      @required StoreName name,
      @required StoreBanner banner,
      @required StoreMenu menu,
      @required StorePic16 pics,
      @required UniqueId ownerId,
      @required StoreLocation location,
      @required StorePrefs prefs,
      @required bool isOwner}) {
    return _Store(
      id: id,
      name: name,
      banner: banner,
      menu: menu,
      pics: pics,
      ownerId: ownerId,
      location: location,
      prefs: prefs,
      isOwner: isOwner,
    );
  }
}

// ignore: unused_element
const $Store = _$StoreTearOff();

mixin _$Store {
  UniqueId get id;
  StoreName get name;
  StoreBanner get banner;
  StoreMenu get menu;
  StorePic16 get pics;
  UniqueId get ownerId;
  StoreLocation get location;
  StorePrefs get prefs;
  bool get isOwner;

  $StoreCopyWith<Store> get copyWith;
}

abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      StoreName name,
      StoreBanner banner,
      StoreMenu menu,
      StorePic16 pics,
      UniqueId ownerId,
      StoreLocation location,
      StorePrefs prefs,
      bool isOwner});

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
    Object name = freezed,
    Object banner = freezed,
    Object menu = freezed,
    Object pics = freezed,
    Object ownerId = freezed,
    Object location = freezed,
    Object prefs = freezed,
    Object isOwner = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as StoreName,
      banner: banner == freezed ? _value.banner : banner as StoreBanner,
      menu: menu == freezed ? _value.menu : menu as StoreMenu,
      pics: pics == freezed ? _value.pics : pics as StorePic16,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as UniqueId,
      location:
          location == freezed ? _value.location : location as StoreLocation,
      prefs: prefs == freezed ? _value.prefs : prefs as StorePrefs,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool,
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
      {UniqueId id,
      StoreName name,
      StoreBanner banner,
      StoreMenu menu,
      StorePic16 pics,
      UniqueId ownerId,
      StoreLocation location,
      StorePrefs prefs,
      bool isOwner});

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
    Object name = freezed,
    Object banner = freezed,
    Object menu = freezed,
    Object pics = freezed,
    Object ownerId = freezed,
    Object location = freezed,
    Object prefs = freezed,
    Object isOwner = freezed,
  }) {
    return _then(_Store(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as StoreName,
      banner: banner == freezed ? _value.banner : banner as StoreBanner,
      menu: menu == freezed ? _value.menu : menu as StoreMenu,
      pics: pics == freezed ? _value.pics : pics as StorePic16,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as UniqueId,
      location:
          location == freezed ? _value.location : location as StoreLocation,
      prefs: prefs == freezed ? _value.prefs : prefs as StorePrefs,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool,
    ));
  }
}

class _$_Store extends _Store {
  const _$_Store(
      {@required this.id,
      @required this.name,
      @required this.banner,
      @required this.menu,
      @required this.pics,
      @required this.ownerId,
      @required this.location,
      @required this.prefs,
      @required this.isOwner})
      : assert(id != null),
        assert(name != null),
        assert(banner != null),
        assert(menu != null),
        assert(pics != null),
        assert(ownerId != null),
        assert(location != null),
        assert(prefs != null),
        assert(isOwner != null),
        super._();

  @override
  final UniqueId id;
  @override
  final StoreName name;
  @override
  final StoreBanner banner;
  @override
  final StoreMenu menu;
  @override
  final StorePic16 pics;
  @override
  final UniqueId ownerId;
  @override
  final StoreLocation location;
  @override
  final StorePrefs prefs;
  @override
  final bool isOwner;

  @override
  String toString() {
    return 'Store(id: $id, name: $name, banner: $banner, menu: $menu, pics: $pics, ownerId: $ownerId, location: $location, prefs: $prefs, isOwner: $isOwner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Store &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.banner, banner) ||
                const DeepCollectionEquality().equals(other.banner, banner)) &&
            (identical(other.menu, menu) ||
                const DeepCollectionEquality().equals(other.menu, menu)) &&
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
            (identical(other.isOwner, isOwner) ||
                const DeepCollectionEquality().equals(other.isOwner, isOwner)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(banner) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(pics) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(prefs) ^
      const DeepCollectionEquality().hash(isOwner);

  @override
  _$StoreCopyWith<_Store> get copyWith =>
      __$StoreCopyWithImpl<_Store>(this, _$identity);
}

abstract class _Store extends Store {
  const _Store._() : super._();
  const factory _Store(
      {@required UniqueId id,
      @required StoreName name,
      @required StoreBanner banner,
      @required StoreMenu menu,
      @required StorePic16 pics,
      @required UniqueId ownerId,
      @required StoreLocation location,
      @required StorePrefs prefs,
      @required bool isOwner}) = _$_Store;

  @override
  UniqueId get id;
  @override
  StoreName get name;
  @override
  StoreBanner get banner;
  @override
  StoreMenu get menu;
  @override
  StorePic16 get pics;
  @override
  UniqueId get ownerId;
  @override
  StoreLocation get location;
  @override
  StorePrefs get prefs;
  @override
  bool get isOwner;
  @override
  _$StoreCopyWith<_Store> get copyWith;
}
