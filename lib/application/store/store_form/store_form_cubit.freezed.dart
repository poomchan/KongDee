// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StoreFormStateTearOff {
  const _$StoreFormStateTearOff();

// ignore: unused_element
  _StoreFormState call(
      {@required
          Store store,
      @required
          bool isEditting,
      @required
          bool isSaving,
      @required
          bool showErrorMessage,
      @required
          Option<Either<StoreFailure, Unit>> saveFailureOrSuccessOption}) {
    return _StoreFormState(
      store: store,
      isEditting: isEditting,
      isSaving: isSaving,
      showErrorMessage: showErrorMessage,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $StoreFormState = _$StoreFormStateTearOff();

mixin _$StoreFormState {
  Store get store;
  bool get isEditting;
  bool get isSaving;
  bool get showErrorMessage;
  Option<Either<StoreFailure, Unit>> get saveFailureOrSuccessOption;

  $StoreFormStateCopyWith<StoreFormState> get copyWith;
}

abstract class $StoreFormStateCopyWith<$Res> {
  factory $StoreFormStateCopyWith(
          StoreFormState value, $Res Function(StoreFormState) then) =
      _$StoreFormStateCopyWithImpl<$Res>;
  $Res call(
      {Store store,
      bool isEditting,
      bool isSaving,
      bool showErrorMessage,
      Option<Either<StoreFailure, Unit>> saveFailureOrSuccessOption});

  $StoreCopyWith<$Res> get store;
}

class _$StoreFormStateCopyWithImpl<$Res>
    implements $StoreFormStateCopyWith<$Res> {
  _$StoreFormStateCopyWithImpl(this._value, this._then);

  final StoreFormState _value;
  // ignore: unused_field
  final $Res Function(StoreFormState) _then;

  @override
  $Res call({
    Object store = freezed,
    Object isEditting = freezed,
    Object isSaving = freezed,
    Object showErrorMessage = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      store: store == freezed ? _value.store : store as Store,
      isEditting:
          isEditting == freezed ? _value.isEditting : isEditting as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<StoreFailure, Unit>>,
    ));
  }

  @override
  $StoreCopyWith<$Res> get store {
    if (_value.store == null) {
      return null;
    }
    return $StoreCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value));
    });
  }
}

abstract class _$StoreFormStateCopyWith<$Res>
    implements $StoreFormStateCopyWith<$Res> {
  factory _$StoreFormStateCopyWith(
          _StoreFormState value, $Res Function(_StoreFormState) then) =
      __$StoreFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Store store,
      bool isEditting,
      bool isSaving,
      bool showErrorMessage,
      Option<Either<StoreFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $StoreCopyWith<$Res> get store;
}

class __$StoreFormStateCopyWithImpl<$Res>
    extends _$StoreFormStateCopyWithImpl<$Res>
    implements _$StoreFormStateCopyWith<$Res> {
  __$StoreFormStateCopyWithImpl(
      _StoreFormState _value, $Res Function(_StoreFormState) _then)
      : super(_value, (v) => _then(v as _StoreFormState));

  @override
  _StoreFormState get _value => super._value as _StoreFormState;

  @override
  $Res call({
    Object store = freezed,
    Object isEditting = freezed,
    Object isSaving = freezed,
    Object showErrorMessage = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_StoreFormState(
      store: store == freezed ? _value.store : store as Store,
      isEditting:
          isEditting == freezed ? _value.isEditting : isEditting as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      showErrorMessage: showErrorMessage == freezed
          ? _value.showErrorMessage
          : showErrorMessage as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<StoreFailure, Unit>>,
    ));
  }
}

class _$_StoreFormState
    with DiagnosticableTreeMixin
    implements _StoreFormState {
  const _$_StoreFormState(
      {@required this.store,
      @required this.isEditting,
      @required this.isSaving,
      @required this.showErrorMessage,
      @required this.saveFailureOrSuccessOption})
      : assert(store != null),
        assert(isEditting != null),
        assert(isSaving != null),
        assert(showErrorMessage != null),
        assert(saveFailureOrSuccessOption != null);

  @override
  final Store store;
  @override
  final bool isEditting;
  @override
  final bool isSaving;
  @override
  final bool showErrorMessage;
  @override
  final Option<Either<StoreFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StoreFormState(store: $store, isEditting: $isEditting, isSaving: $isSaving, showErrorMessage: $showErrorMessage, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StoreFormState'))
      ..add(DiagnosticsProperty('store', store))
      ..add(DiagnosticsProperty('isEditting', isEditting))
      ..add(DiagnosticsProperty('isSaving', isSaving))
      ..add(DiagnosticsProperty('showErrorMessage', showErrorMessage))
      ..add(DiagnosticsProperty(
          'saveFailureOrSuccessOption', saveFailureOrSuccessOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreFormState &&
            (identical(other.store, store) ||
                const DeepCollectionEquality().equals(other.store, store)) &&
            (identical(other.isEditting, isEditting) ||
                const DeepCollectionEquality()
                    .equals(other.isEditting, isEditting)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality()
                    .equals(other.isSaving, isSaving)) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessage, showErrorMessage)) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(store) ^
      const DeepCollectionEquality().hash(isEditting) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(showErrorMessage) ^
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption);

  @override
  _$StoreFormStateCopyWith<_StoreFormState> get copyWith =>
      __$StoreFormStateCopyWithImpl<_StoreFormState>(this, _$identity);
}

abstract class _StoreFormState implements StoreFormState {
  const factory _StoreFormState(
          {@required
              Store store,
          @required
              bool isEditting,
          @required
              bool isSaving,
          @required
              bool showErrorMessage,
          @required
              Option<Either<StoreFailure, Unit>> saveFailureOrSuccessOption}) =
      _$_StoreFormState;

  @override
  Store get store;
  @override
  bool get isEditting;
  @override
  bool get isSaving;
  @override
  bool get showErrorMessage;
  @override
  Option<Either<StoreFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  _$StoreFormStateCopyWith<_StoreFormState> get copyWith;
}
