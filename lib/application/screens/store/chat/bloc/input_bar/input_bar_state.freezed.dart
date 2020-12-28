// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'input_bar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$InputBarStateTearOff {
  const _$InputBarStateTearOff();

// ignore: unused_element
  _InputBarState call(
      {@required bool isUploading, @required bool showErrorMessage}) {
    return _InputBarState(
      isUploading: isUploading,
      showErrorMessage: showErrorMessage,
    );
  }
}

// ignore: unused_element
const $InputBarState = _$InputBarStateTearOff();

mixin _$InputBarState {
  bool get isUploading;
  bool get showErrorMessage;

  $InputBarStateCopyWith<InputBarState> get copyWith;
}

abstract class $InputBarStateCopyWith<$Res> {
  factory $InputBarStateCopyWith(
          InputBarState value, $Res Function(InputBarState) then) =
      _$InputBarStateCopyWithImpl<$Res>;
  $Res call({bool isUploading, bool showErrorMessage});
}

class _$InputBarStateCopyWithImpl<$Res>
    implements $InputBarStateCopyWith<$Res> {
  _$InputBarStateCopyWithImpl(this._value, this._then);

  final InputBarState _value;
  // ignore: unused_field
  final $Res Function(InputBarState) _then;

  @override
  $Res call({
    Object isUploading = freezed,
    Object showErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isUploading:
          isUploading == freezed ? _value.isUploading : isUploading as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage as bool,
    ));
  }
}

abstract class _$InputBarStateCopyWith<$Res>
    implements $InputBarStateCopyWith<$Res> {
  factory _$InputBarStateCopyWith(
          _InputBarState value, $Res Function(_InputBarState) then) =
      __$InputBarStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isUploading, bool showErrorMessage});
}

class __$InputBarStateCopyWithImpl<$Res>
    extends _$InputBarStateCopyWithImpl<$Res>
    implements _$InputBarStateCopyWith<$Res> {
  __$InputBarStateCopyWithImpl(
      _InputBarState _value, $Res Function(_InputBarState) _then)
      : super(_value, (v) => _then(v as _InputBarState));

  @override
  _InputBarState get _value => super._value as _InputBarState;

  @override
  $Res call({
    Object isUploading = freezed,
    Object showErrorMessage = freezed,
  }) {
    return _then(_InputBarState(
      isUploading:
          isUploading == freezed ? _value.isUploading : isUploading as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage as bool,
    ));
  }
}

class _$_InputBarState implements _InputBarState {
  const _$_InputBarState(
      {@required this.isUploading, @required this.showErrorMessage})
      : assert(isUploading != null),
        assert(showErrorMessage != null);

  @override
  final bool isUploading;
  @override
  final bool showErrorMessage;

  @override
  String toString() {
    return 'InputBarState(isUploading: $isUploading, showErrorMessage: $showErrorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InputBarState &&
            (identical(other.isUploading, isUploading) ||
                const DeepCollectionEquality()
                    .equals(other.isUploading, isUploading)) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessage, showErrorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isUploading) ^
      const DeepCollectionEquality().hash(showErrorMessage);

  @override
  _$InputBarStateCopyWith<_InputBarState> get copyWith =>
      __$InputBarStateCopyWithImpl<_InputBarState>(this, _$identity);
}

abstract class _InputBarState implements InputBarState {
  const factory _InputBarState(
      {@required bool isUploading,
      @required bool showErrorMessage}) = _$_InputBarState;

  @override
  bool get isUploading;
  @override
  bool get showErrorMessage;
  @override
  _$InputBarStateCopyWith<_InputBarState> get copyWith;
}
