// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_pref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StorePrefsTearOff {
  const _$StorePrefsTearOff();

// ignore: unused_element
  _StorePrefs call(
      {@required bool isOpen,
      @required bool isNotificationOn,
      @required SellingRange sellingRange}) {
    return _StorePrefs(
      isOpen: isOpen,
      isNotificationOn: isNotificationOn,
      sellingRange: sellingRange,
    );
  }
}

// ignore: unused_element
const $StorePrefs = _$StorePrefsTearOff();

mixin _$StorePrefs {
  bool get isOpen;
  bool get isNotificationOn;
  SellingRange get sellingRange;

  $StorePrefsCopyWith<StorePrefs> get copyWith;
}

abstract class $StorePrefsCopyWith<$Res> {
  factory $StorePrefsCopyWith(
          StorePrefs value, $Res Function(StorePrefs) then) =
      _$StorePrefsCopyWithImpl<$Res>;
  $Res call({bool isOpen, bool isNotificationOn, SellingRange sellingRange});
}

class _$StorePrefsCopyWithImpl<$Res> implements $StorePrefsCopyWith<$Res> {
  _$StorePrefsCopyWithImpl(this._value, this._then);

  final StorePrefs _value;
  // ignore: unused_field
  final $Res Function(StorePrefs) _then;

  @override
  $Res call({
    Object isOpen = freezed,
    Object isNotificationOn = freezed,
    Object sellingRange = freezed,
  }) {
    return _then(_value.copyWith(
      isOpen: isOpen == freezed ? _value.isOpen : isOpen as bool,
      isNotificationOn: isNotificationOn == freezed
          ? _value.isNotificationOn
          : isNotificationOn as bool,
      sellingRange: sellingRange == freezed
          ? _value.sellingRange
          : sellingRange as SellingRange,
    ));
  }
}

abstract class _$StorePrefsCopyWith<$Res> implements $StorePrefsCopyWith<$Res> {
  factory _$StorePrefsCopyWith(
          _StorePrefs value, $Res Function(_StorePrefs) then) =
      __$StorePrefsCopyWithImpl<$Res>;
  @override
  $Res call({bool isOpen, bool isNotificationOn, SellingRange sellingRange});
}

class __$StorePrefsCopyWithImpl<$Res> extends _$StorePrefsCopyWithImpl<$Res>
    implements _$StorePrefsCopyWith<$Res> {
  __$StorePrefsCopyWithImpl(
      _StorePrefs _value, $Res Function(_StorePrefs) _then)
      : super(_value, (v) => _then(v as _StorePrefs));

  @override
  _StorePrefs get _value => super._value as _StorePrefs;

  @override
  $Res call({
    Object isOpen = freezed,
    Object isNotificationOn = freezed,
    Object sellingRange = freezed,
  }) {
    return _then(_StorePrefs(
      isOpen: isOpen == freezed ? _value.isOpen : isOpen as bool,
      isNotificationOn: isNotificationOn == freezed
          ? _value.isNotificationOn
          : isNotificationOn as bool,
      sellingRange: sellingRange == freezed
          ? _value.sellingRange
          : sellingRange as SellingRange,
    ));
  }
}

class _$_StorePrefs extends _StorePrefs {
  const _$_StorePrefs(
      {@required this.isOpen,
      @required this.isNotificationOn,
      @required this.sellingRange})
      : assert(isOpen != null),
        assert(isNotificationOn != null),
        assert(sellingRange != null),
        super._();

  @override
  final bool isOpen;
  @override
  final bool isNotificationOn;
  @override
  final SellingRange sellingRange;

  @override
  String toString() {
    return 'StorePrefs(isOpen: $isOpen, isNotificationOn: $isNotificationOn, sellingRange: $sellingRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StorePrefs &&
            (identical(other.isOpen, isOpen) ||
                const DeepCollectionEquality().equals(other.isOpen, isOpen)) &&
            (identical(other.isNotificationOn, isNotificationOn) ||
                const DeepCollectionEquality()
                    .equals(other.isNotificationOn, isNotificationOn)) &&
            (identical(other.sellingRange, sellingRange) ||
                const DeepCollectionEquality()
                    .equals(other.sellingRange, sellingRange)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isOpen) ^
      const DeepCollectionEquality().hash(isNotificationOn) ^
      const DeepCollectionEquality().hash(sellingRange);

  @override
  _$StorePrefsCopyWith<_StorePrefs> get copyWith =>
      __$StorePrefsCopyWithImpl<_StorePrefs>(this, _$identity);
}

abstract class _StorePrefs extends StorePrefs {
  const _StorePrefs._() : super._();
  const factory _StorePrefs(
      {@required bool isOpen,
      @required bool isNotificationOn,
      @required SellingRange sellingRange}) = _$_StorePrefs;

  @override
  bool get isOpen;
  @override
  bool get isNotificationOn;
  @override
  SellingRange get sellingRange;
  @override
  _$StorePrefsCopyWith<_StorePrefs> get copyWith;
}
