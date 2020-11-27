// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'range_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RangeFormStateTearOff {
  const _$RangeFormStateTearOff();

// ignore: unused_element
  _RangeFormState call(
      {@required SellingRange range,
      @required bool isInfinite,
      @required bool isValid}) {
    return _RangeFormState(
      range: range,
      isInfinite: isInfinite,
      isValid: isValid,
    );
  }
}

// ignore: unused_element
const $RangeFormState = _$RangeFormStateTearOff();

mixin _$RangeFormState {
  SellingRange get range;
  bool get isInfinite;
  bool get isValid;

  $RangeFormStateCopyWith<RangeFormState> get copyWith;
}

abstract class $RangeFormStateCopyWith<$Res> {
  factory $RangeFormStateCopyWith(
          RangeFormState value, $Res Function(RangeFormState) then) =
      _$RangeFormStateCopyWithImpl<$Res>;
  $Res call({SellingRange range, bool isInfinite, bool isValid});
}

class _$RangeFormStateCopyWithImpl<$Res>
    implements $RangeFormStateCopyWith<$Res> {
  _$RangeFormStateCopyWithImpl(this._value, this._then);

  final RangeFormState _value;
  // ignore: unused_field
  final $Res Function(RangeFormState) _then;

  @override
  $Res call({
    Object range = freezed,
    Object isInfinite = freezed,
    Object isValid = freezed,
  }) {
    return _then(_value.copyWith(
      range: range == freezed ? _value.range : range as SellingRange,
      isInfinite:
          isInfinite == freezed ? _value.isInfinite : isInfinite as bool,
      isValid: isValid == freezed ? _value.isValid : isValid as bool,
    ));
  }
}

abstract class _$RangeFormStateCopyWith<$Res>
    implements $RangeFormStateCopyWith<$Res> {
  factory _$RangeFormStateCopyWith(
          _RangeFormState value, $Res Function(_RangeFormState) then) =
      __$RangeFormStateCopyWithImpl<$Res>;
  @override
  $Res call({SellingRange range, bool isInfinite, bool isValid});
}

class __$RangeFormStateCopyWithImpl<$Res>
    extends _$RangeFormStateCopyWithImpl<$Res>
    implements _$RangeFormStateCopyWith<$Res> {
  __$RangeFormStateCopyWithImpl(
      _RangeFormState _value, $Res Function(_RangeFormState) _then)
      : super(_value, (v) => _then(v as _RangeFormState));

  @override
  _RangeFormState get _value => super._value as _RangeFormState;

  @override
  $Res call({
    Object range = freezed,
    Object isInfinite = freezed,
    Object isValid = freezed,
  }) {
    return _then(_RangeFormState(
      range: range == freezed ? _value.range : range as SellingRange,
      isInfinite:
          isInfinite == freezed ? _value.isInfinite : isInfinite as bool,
      isValid: isValid == freezed ? _value.isValid : isValid as bool,
    ));
  }
}

class _$_RangeFormState
    with DiagnosticableTreeMixin
    implements _RangeFormState {
  const _$_RangeFormState(
      {@required this.range, @required this.isInfinite, @required this.isValid})
      : assert(range != null),
        assert(isInfinite != null),
        assert(isValid != null);

  @override
  final SellingRange range;
  @override
  final bool isInfinite;
  @override
  final bool isValid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RangeFormState(range: $range, isInfinite: $isInfinite, isValid: $isValid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RangeFormState'))
      ..add(DiagnosticsProperty('range', range))
      ..add(DiagnosticsProperty('isInfinite', isInfinite))
      ..add(DiagnosticsProperty('isValid', isValid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RangeFormState &&
            (identical(other.range, range) ||
                const DeepCollectionEquality().equals(other.range, range)) &&
            (identical(other.isInfinite, isInfinite) ||
                const DeepCollectionEquality()
                    .equals(other.isInfinite, isInfinite)) &&
            (identical(other.isValid, isValid) ||
                const DeepCollectionEquality().equals(other.isValid, isValid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(range) ^
      const DeepCollectionEquality().hash(isInfinite) ^
      const DeepCollectionEquality().hash(isValid);

  @override
  _$RangeFormStateCopyWith<_RangeFormState> get copyWith =>
      __$RangeFormStateCopyWithImpl<_RangeFormState>(this, _$identity);
}

abstract class _RangeFormState implements RangeFormState {
  const factory _RangeFormState(
      {@required SellingRange range,
      @required bool isInfinite,
      @required bool isValid}) = _$_RangeFormState;

  @override
  SellingRange get range;
  @override
  bool get isInfinite;
  @override
  bool get isValid;
  @override
  _$RangeFormStateCopyWith<_RangeFormState> get copyWith;
}
