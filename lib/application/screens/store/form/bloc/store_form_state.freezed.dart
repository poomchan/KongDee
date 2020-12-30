// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StoreFormStateTearOff {
  const _$StoreFormStateTearOff();

// ignore: unused_element
  _StoreFormState call(
      {@required bool isCreating,
      @required Option<Store> initStoreOption,
      @required Either<File, String> banner,
      @required List<Either<File, String>> pics}) {
    return _StoreFormState(
      isCreating: isCreating,
      initStoreOption: initStoreOption,
      banner: banner,
      pics: pics,
    );
  }
}

// ignore: unused_element
const $StoreFormState = _$StoreFormStateTearOff();

mixin _$StoreFormState {
  bool get isCreating;
  Option<Store> get initStoreOption;
  Either<File, String> get banner;
  List<Either<File, String>> get pics;

  $StoreFormStateCopyWith<StoreFormState> get copyWith;
}

abstract class $StoreFormStateCopyWith<$Res> {
  factory $StoreFormStateCopyWith(
          StoreFormState value, $Res Function(StoreFormState) then) =
      _$StoreFormStateCopyWithImpl<$Res>;
  $Res call(
      {bool isCreating,
      Option<Store> initStoreOption,
      Either<File, String> banner,
      List<Either<File, String>> pics});
}

class _$StoreFormStateCopyWithImpl<$Res>
    implements $StoreFormStateCopyWith<$Res> {
  _$StoreFormStateCopyWithImpl(this._value, this._then);

  final StoreFormState _value;
  // ignore: unused_field
  final $Res Function(StoreFormState) _then;

  @override
  $Res call({
    Object isCreating = freezed,
    Object initStoreOption = freezed,
    Object banner = freezed,
    Object pics = freezed,
  }) {
    return _then(_value.copyWith(
      isCreating:
          isCreating == freezed ? _value.isCreating : isCreating as bool,
      initStoreOption: initStoreOption == freezed
          ? _value.initStoreOption
          : initStoreOption as Option<Store>,
      banner:
          banner == freezed ? _value.banner : banner as Either<File, String>,
      pics: pics == freezed ? _value.pics : pics as List<Either<File, String>>,
    ));
  }
}

abstract class _$StoreFormStateCopyWith<$Res>
    implements $StoreFormStateCopyWith<$Res> {
  factory _$StoreFormStateCopyWith(
          _StoreFormState value, $Res Function(_StoreFormState) then) =
      __$StoreFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isCreating,
      Option<Store> initStoreOption,
      Either<File, String> banner,
      List<Either<File, String>> pics});
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
    Object isCreating = freezed,
    Object initStoreOption = freezed,
    Object banner = freezed,
    Object pics = freezed,
  }) {
    return _then(_StoreFormState(
      isCreating:
          isCreating == freezed ? _value.isCreating : isCreating as bool,
      initStoreOption: initStoreOption == freezed
          ? _value.initStoreOption
          : initStoreOption as Option<Store>,
      banner:
          banner == freezed ? _value.banner : banner as Either<File, String>,
      pics: pics == freezed ? _value.pics : pics as List<Either<File, String>>,
    ));
  }
}

class _$_StoreFormState implements _StoreFormState {
  const _$_StoreFormState(
      {@required this.isCreating,
      @required this.initStoreOption,
      @required this.banner,
      @required this.pics})
      : assert(isCreating != null),
        assert(initStoreOption != null),
        assert(banner != null),
        assert(pics != null);

  @override
  final bool isCreating;
  @override
  final Option<Store> initStoreOption;
  @override
  final Either<File, String> banner;
  @override
  final List<Either<File, String>> pics;

  @override
  String toString() {
    return 'StoreFormState(isCreating: $isCreating, initStoreOption: $initStoreOption, banner: $banner, pics: $pics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreFormState &&
            (identical(other.isCreating, isCreating) ||
                const DeepCollectionEquality()
                    .equals(other.isCreating, isCreating)) &&
            (identical(other.initStoreOption, initStoreOption) ||
                const DeepCollectionEquality()
                    .equals(other.initStoreOption, initStoreOption)) &&
            (identical(other.banner, banner) ||
                const DeepCollectionEquality().equals(other.banner, banner)) &&
            (identical(other.pics, pics) ||
                const DeepCollectionEquality().equals(other.pics, pics)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isCreating) ^
      const DeepCollectionEquality().hash(initStoreOption) ^
      const DeepCollectionEquality().hash(banner) ^
      const DeepCollectionEquality().hash(pics);

  @override
  _$StoreFormStateCopyWith<_StoreFormState> get copyWith =>
      __$StoreFormStateCopyWithImpl<_StoreFormState>(this, _$identity);
}

abstract class _StoreFormState implements StoreFormState {
  const factory _StoreFormState(
      {@required bool isCreating,
      @required Option<Store> initStoreOption,
      @required Either<File, String> banner,
      @required List<Either<File, String>> pics}) = _$_StoreFormState;

  @override
  bool get isCreating;
  @override
  Option<Store> get initStoreOption;
  @override
  Either<File, String> get banner;
  @override
  List<Either<File, String>> get pics;
  @override
  _$StoreFormStateCopyWith<_StoreFormState> get copyWith;
}
