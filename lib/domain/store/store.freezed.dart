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
      @required int distanceAway,
      @required String formattedAddress,
      @required UniqueId ownerId,
      GeoPoint geoPoint}) {
    return _Store(
      id: id,
      name: name,
      banner: banner,
      menu: menu,
      pics: pics,
      distanceAway: distanceAway,
      formattedAddress: formattedAddress,
      ownerId: ownerId,
      geoPoint: geoPoint,
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
  int get distanceAway;
  String get formattedAddress;
  UniqueId get ownerId;
  GeoPoint get geoPoint;

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
      int distanceAway,
      String formattedAddress,
      UniqueId ownerId,
      GeoPoint geoPoint});
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
    Object distanceAway = freezed,
    Object formattedAddress = freezed,
    Object ownerId = freezed,
    Object geoPoint = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as StoreName,
      banner: banner == freezed ? _value.banner : banner as StoreBanner,
      menu: menu == freezed ? _value.menu : menu as StoreMenu,
      pics: pics == freezed ? _value.pics : pics as StorePic16,
      distanceAway:
          distanceAway == freezed ? _value.distanceAway : distanceAway as int,
      formattedAddress: formattedAddress == freezed
          ? _value.formattedAddress
          : formattedAddress as String,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as UniqueId,
      geoPoint: geoPoint == freezed ? _value.geoPoint : geoPoint as GeoPoint,
    ));
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
      int distanceAway,
      String formattedAddress,
      UniqueId ownerId,
      GeoPoint geoPoint});
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
    Object distanceAway = freezed,
    Object formattedAddress = freezed,
    Object ownerId = freezed,
    Object geoPoint = freezed,
  }) {
    return _then(_Store(
      id: id == freezed ? _value.id : id as UniqueId,
      name: name == freezed ? _value.name : name as StoreName,
      banner: banner == freezed ? _value.banner : banner as StoreBanner,
      menu: menu == freezed ? _value.menu : menu as StoreMenu,
      pics: pics == freezed ? _value.pics : pics as StorePic16,
      distanceAway:
          distanceAway == freezed ? _value.distanceAway : distanceAway as int,
      formattedAddress: formattedAddress == freezed
          ? _value.formattedAddress
          : formattedAddress as String,
      ownerId: ownerId == freezed ? _value.ownerId : ownerId as UniqueId,
      geoPoint: geoPoint == freezed ? _value.geoPoint : geoPoint as GeoPoint,
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
      @required this.distanceAway,
      @required this.formattedAddress,
      @required this.ownerId,
      this.geoPoint})
      : assert(id != null),
        assert(name != null),
        assert(banner != null),
        assert(menu != null),
        assert(pics != null),
        assert(distanceAway != null),
        assert(formattedAddress != null),
        assert(ownerId != null),
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
  final int distanceAway;
  @override
  final String formattedAddress;
  @override
  final UniqueId ownerId;
  @override
  final GeoPoint geoPoint;

  @override
  String toString() {
    return 'Store(id: $id, name: $name, banner: $banner, menu: $menu, pics: $pics, distanceAway: $distanceAway, formattedAddress: $formattedAddress, ownerId: $ownerId, geoPoint: $geoPoint)';
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
            (identical(other.distanceAway, distanceAway) ||
                const DeepCollectionEquality()
                    .equals(other.distanceAway, distanceAway)) &&
            (identical(other.formattedAddress, formattedAddress) ||
                const DeepCollectionEquality()
                    .equals(other.formattedAddress, formattedAddress)) &&
            (identical(other.ownerId, ownerId) ||
                const DeepCollectionEquality()
                    .equals(other.ownerId, ownerId)) &&
            (identical(other.geoPoint, geoPoint) ||
                const DeepCollectionEquality()
                    .equals(other.geoPoint, geoPoint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(banner) ^
      const DeepCollectionEquality().hash(menu) ^
      const DeepCollectionEquality().hash(pics) ^
      const DeepCollectionEquality().hash(distanceAway) ^
      const DeepCollectionEquality().hash(formattedAddress) ^
      const DeepCollectionEquality().hash(ownerId) ^
      const DeepCollectionEquality().hash(geoPoint);

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
      @required int distanceAway,
      @required String formattedAddress,
      @required UniqueId ownerId,
      GeoPoint geoPoint}) = _$_Store;

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
  int get distanceAway;
  @override
  String get formattedAddress;
  @override
  UniqueId get ownerId;
  @override
  GeoPoint get geoPoint;
  @override
  _$StoreCopyWith<_Store> get copyWith;
}
