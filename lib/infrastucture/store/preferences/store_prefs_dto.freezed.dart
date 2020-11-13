// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_prefs_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
StorePrefsDto _$StorePrefsDtoFromJson(Map<String, dynamic> json) {
  return _StorePrefsDto.fromJson(json);
}

class _$StorePrefsDtoTearOff {
  const _$StorePrefsDtoTearOff();

// ignore: unused_element
  _StorePrefsDto call(
      {@required bool isOpen,
      @required bool isNotificationOn,
      @required double sellingRange}) {
    return _StorePrefsDto(
      isOpen: isOpen,
      isNotificationOn: isNotificationOn,
      sellingRange: sellingRange,
    );
  }
}

// ignore: unused_element
const $StorePrefsDto = _$StorePrefsDtoTearOff();

mixin _$StorePrefsDto {
  bool get isOpen;
  bool get isNotificationOn;
  double get sellingRange;

  Map<String, dynamic> toJson();
  $StorePrefsDtoCopyWith<StorePrefsDto> get copyWith;
}

abstract class $StorePrefsDtoCopyWith<$Res> {
  factory $StorePrefsDtoCopyWith(
          StorePrefsDto value, $Res Function(StorePrefsDto) then) =
      _$StorePrefsDtoCopyWithImpl<$Res>;
  $Res call({bool isOpen, bool isNotificationOn, double sellingRange});
}

class _$StorePrefsDtoCopyWithImpl<$Res>
    implements $StorePrefsDtoCopyWith<$Res> {
  _$StorePrefsDtoCopyWithImpl(this._value, this._then);

  final StorePrefsDto _value;
  // ignore: unused_field
  final $Res Function(StorePrefsDto) _then;

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
          : sellingRange as double,
    ));
  }
}

abstract class _$StorePrefsDtoCopyWith<$Res>
    implements $StorePrefsDtoCopyWith<$Res> {
  factory _$StorePrefsDtoCopyWith(
          _StorePrefsDto value, $Res Function(_StorePrefsDto) then) =
      __$StorePrefsDtoCopyWithImpl<$Res>;
  @override
  $Res call({bool isOpen, bool isNotificationOn, double sellingRange});
}

class __$StorePrefsDtoCopyWithImpl<$Res>
    extends _$StorePrefsDtoCopyWithImpl<$Res>
    implements _$StorePrefsDtoCopyWith<$Res> {
  __$StorePrefsDtoCopyWithImpl(
      _StorePrefsDto _value, $Res Function(_StorePrefsDto) _then)
      : super(_value, (v) => _then(v as _StorePrefsDto));

  @override
  _StorePrefsDto get _value => super._value as _StorePrefsDto;

  @override
  $Res call({
    Object isOpen = freezed,
    Object isNotificationOn = freezed,
    Object sellingRange = freezed,
  }) {
    return _then(_StorePrefsDto(
      isOpen: isOpen == freezed ? _value.isOpen : isOpen as bool,
      isNotificationOn: isNotificationOn == freezed
          ? _value.isNotificationOn
          : isNotificationOn as bool,
      sellingRange: sellingRange == freezed
          ? _value.sellingRange
          : sellingRange as double,
    ));
  }
}

@JsonSerializable()
class _$_StorePrefsDto extends _StorePrefsDto {
  const _$_StorePrefsDto(
      {@required this.isOpen,
      @required this.isNotificationOn,
      @required this.sellingRange})
      : assert(isOpen != null),
        assert(isNotificationOn != null),
        assert(sellingRange != null),
        super._();

  factory _$_StorePrefsDto.fromJson(Map<String, dynamic> json) =>
      _$_$_StorePrefsDtoFromJson(json);

  @override
  final bool isOpen;
  @override
  final bool isNotificationOn;
  @override
  final double sellingRange;

  @override
  String toString() {
    return 'StorePrefsDto(isOpen: $isOpen, isNotificationOn: $isNotificationOn, sellingRange: $sellingRange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StorePrefsDto &&
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
  _$StorePrefsDtoCopyWith<_StorePrefsDto> get copyWith =>
      __$StorePrefsDtoCopyWithImpl<_StorePrefsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StorePrefsDtoToJson(this);
  }
}

abstract class _StorePrefsDto extends StorePrefsDto {
  const _StorePrefsDto._() : super._();
  const factory _StorePrefsDto(
      {@required bool isOpen,
      @required bool isNotificationOn,
      @required double sellingRange}) = _$_StorePrefsDto;

  factory _StorePrefsDto.fromJson(Map<String, dynamic> json) =
      _$_StorePrefsDto.fromJson;

  @override
  bool get isOpen;
  @override
  bool get isNotificationOn;
  @override
  double get sellingRange;
  @override
  _$StorePrefsDtoCopyWith<_StorePrefsDto> get copyWith;
}
