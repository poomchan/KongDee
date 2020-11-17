// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StoreListTearOff {
  const _$StoreListTearOff();

// ignore: unused_element
  _StoreList call({@required List<Store> value}) {
    return _StoreList(
      value: value,
    );
  }
}

// ignore: unused_element
const $StoreList = _$StoreListTearOff();

mixin _$StoreList {
  List<Store> get value;

  $StoreListCopyWith<StoreList> get copyWith;
}

abstract class $StoreListCopyWith<$Res> {
  factory $StoreListCopyWith(StoreList value, $Res Function(StoreList) then) =
      _$StoreListCopyWithImpl<$Res>;
  $Res call({List<Store> value});
}

class _$StoreListCopyWithImpl<$Res> implements $StoreListCopyWith<$Res> {
  _$StoreListCopyWithImpl(this._value, this._then);

  final StoreList _value;
  // ignore: unused_field
  final $Res Function(StoreList) _then;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed ? _value.value : value as List<Store>,
    ));
  }
}

abstract class _$StoreListCopyWith<$Res> implements $StoreListCopyWith<$Res> {
  factory _$StoreListCopyWith(
          _StoreList value, $Res Function(_StoreList) then) =
      __$StoreListCopyWithImpl<$Res>;
  @override
  $Res call({List<Store> value});
}

class __$StoreListCopyWithImpl<$Res> extends _$StoreListCopyWithImpl<$Res>
    implements _$StoreListCopyWith<$Res> {
  __$StoreListCopyWithImpl(_StoreList _value, $Res Function(_StoreList) _then)
      : super(_value, (v) => _then(v as _StoreList));

  @override
  _StoreList get _value => super._value as _StoreList;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(_StoreList(
      value: value == freezed ? _value.value : value as List<Store>,
    ));
  }
}

class _$_StoreList extends _StoreList with DiagnosticableTreeMixin {
  const _$_StoreList({@required this.value})
      : assert(value != null),
        super._();

  @override
  final List<Store> value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoreList(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoreList'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreList &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @override
  _$StoreListCopyWith<_StoreList> get copyWith =>
      __$StoreListCopyWithImpl<_StoreList>(this, _$identity);
}

abstract class _StoreList extends StoreList {
  const _StoreList._() : super._();
  const factory _StoreList({@required List<Store> value}) = _$_StoreList;

  @override
  List<Store> get value;
  @override
  _$StoreListCopyWith<_StoreList> get copyWith;
}
