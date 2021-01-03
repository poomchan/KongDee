// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'language_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LanguageStateTearOff {
  const _$LanguageStateTearOff();

// ignore: unused_element
  _LanguageState call({bool isThai = false, bool isEnglishUS = false}) {
    return _LanguageState(
      isThai: isThai,
      isEnglishUS: isEnglishUS,
    );
  }
}

// ignore: unused_element
const $LanguageState = _$LanguageStateTearOff();

mixin _$LanguageState {
  bool get isThai;
  bool get isEnglishUS;

  $LanguageStateCopyWith<LanguageState> get copyWith;
}

abstract class $LanguageStateCopyWith<$Res> {
  factory $LanguageStateCopyWith(
          LanguageState value, $Res Function(LanguageState) then) =
      _$LanguageStateCopyWithImpl<$Res>;
  $Res call({bool isThai, bool isEnglishUS});
}

class _$LanguageStateCopyWithImpl<$Res>
    implements $LanguageStateCopyWith<$Res> {
  _$LanguageStateCopyWithImpl(this._value, this._then);

  final LanguageState _value;
  // ignore: unused_field
  final $Res Function(LanguageState) _then;

  @override
  $Res call({
    Object isThai = freezed,
    Object isEnglishUS = freezed,
  }) {
    return _then(_value.copyWith(
      isThai: isThai == freezed ? _value.isThai : isThai as bool,
      isEnglishUS:
          isEnglishUS == freezed ? _value.isEnglishUS : isEnglishUS as bool,
    ));
  }
}

abstract class _$LanguageStateCopyWith<$Res>
    implements $LanguageStateCopyWith<$Res> {
  factory _$LanguageStateCopyWith(
          _LanguageState value, $Res Function(_LanguageState) then) =
      __$LanguageStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isThai, bool isEnglishUS});
}

class __$LanguageStateCopyWithImpl<$Res>
    extends _$LanguageStateCopyWithImpl<$Res>
    implements _$LanguageStateCopyWith<$Res> {
  __$LanguageStateCopyWithImpl(
      _LanguageState _value, $Res Function(_LanguageState) _then)
      : super(_value, (v) => _then(v as _LanguageState));

  @override
  _LanguageState get _value => super._value as _LanguageState;

  @override
  $Res call({
    Object isThai = freezed,
    Object isEnglishUS = freezed,
  }) {
    return _then(_LanguageState(
      isThai: isThai == freezed ? _value.isThai : isThai as bool,
      isEnglishUS:
          isEnglishUS == freezed ? _value.isEnglishUS : isEnglishUS as bool,
    ));
  }
}

class _$_LanguageState with DiagnosticableTreeMixin implements _LanguageState {
  const _$_LanguageState({this.isThai = false, this.isEnglishUS = false})
      : assert(isThai != null),
        assert(isEnglishUS != null);

  @JsonKey(defaultValue: false)
  @override
  final bool isThai;
  @JsonKey(defaultValue: false)
  @override
  final bool isEnglishUS;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LanguageState(isThai: $isThai, isEnglishUS: $isEnglishUS)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LanguageState'))
      ..add(DiagnosticsProperty('isThai', isThai))
      ..add(DiagnosticsProperty('isEnglishUS', isEnglishUS));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LanguageState &&
            (identical(other.isThai, isThai) ||
                const DeepCollectionEquality().equals(other.isThai, isThai)) &&
            (identical(other.isEnglishUS, isEnglishUS) ||
                const DeepCollectionEquality()
                    .equals(other.isEnglishUS, isEnglishUS)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isThai) ^
      const DeepCollectionEquality().hash(isEnglishUS);

  @override
  _$LanguageStateCopyWith<_LanguageState> get copyWith =>
      __$LanguageStateCopyWithImpl<_LanguageState>(this, _$identity);
}

abstract class _LanguageState implements LanguageState {
  const factory _LanguageState({bool isThai, bool isEnglishUS}) =
      _$_LanguageState;

  @override
  bool get isThai;
  @override
  bool get isEnglishUS;
  @override
  _$LanguageStateCopyWith<_LanguageState> get copyWith;
}
