// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_near_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StoreNearStateTearOff {
  const _$StoreNearStateTearOff();

// ignore: unused_element
  _Initial inital() {
    return const _Initial();
  }

// ignore: unused_element
  _Loading loading(List<Store> previousStoreList) {
    return _Loading(
      previousStoreList,
    );
  }

// ignore: unused_element
  _Loaded loaded(List<Store> storeList, double rad) {
    return _Loaded(
      storeList,
      rad,
    );
  }

// ignore: unused_element
  _Failure failure(StoreFailure f) {
    return _Failure(
      f,
    );
  }
}

// ignore: unused_element
const $StoreNearState = _$StoreNearStateTearOff();

mixin _$StoreNearState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<Store> previousStoreList),
    @required Result loaded(List<Store> storeList, double rad),
    @required Result failure(StoreFailure f),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<Store> previousStoreList),
    Result loaded(List<Store> storeList, double rad),
    Result failure(StoreFailure f),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  });
}

abstract class $StoreNearStateCopyWith<$Res> {
  factory $StoreNearStateCopyWith(
          StoreNearState value, $Res Function(StoreNearState) then) =
      _$StoreNearStateCopyWithImpl<$Res>;
}

class _$StoreNearStateCopyWithImpl<$Res>
    implements $StoreNearStateCopyWith<$Res> {
  _$StoreNearStateCopyWithImpl(this._value, this._then);

  final StoreNearState _value;
  // ignore: unused_field
  final $Res Function(StoreNearState) _then;
}

abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

class __$InitialCopyWithImpl<$Res> extends _$StoreNearStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'StoreNearState.inital()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<Store> previousStoreList),
    @required Result loaded(List<Store> storeList, double rad),
    @required Result failure(StoreFailure f),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return inital();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<Store> previousStoreList),
    Result loaded(List<Store> storeList, double rad),
    Result failure(StoreFailure f),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inital != null) {
      return inital();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return inital(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inital != null) {
      return inital(this);
    }
    return orElse();
  }
}

abstract class _Initial implements StoreNearState {
  const factory _Initial() = _$_Initial;
}

abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  $Res call({List<Store> previousStoreList});
}

class __$LoadingCopyWithImpl<$Res> extends _$StoreNearStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object previousStoreList = freezed,
  }) {
    return _then(_Loading(
      previousStoreList == freezed
          ? _value.previousStoreList
          : previousStoreList as List<Store>,
    ));
  }
}

class _$_Loading implements _Loading {
  const _$_Loading(this.previousStoreList) : assert(previousStoreList != null);

  @override
  final List<Store> previousStoreList;

  @override
  String toString() {
    return 'StoreNearState.loading(previousStoreList: $previousStoreList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loading &&
            (identical(other.previousStoreList, previousStoreList) ||
                const DeepCollectionEquality()
                    .equals(other.previousStoreList, previousStoreList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(previousStoreList);

  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<Store> previousStoreList),
    @required Result loaded(List<Store> storeList, double rad),
    @required Result failure(StoreFailure f),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return loading(previousStoreList);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<Store> previousStoreList),
    Result loaded(List<Store> storeList, double rad),
    Result failure(StoreFailure f),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(previousStoreList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements StoreNearState {
  const factory _Loading(List<Store> previousStoreList) = _$_Loading;

  List<Store> get previousStoreList;
  _$LoadingCopyWith<_Loading> get copyWith;
}

abstract class _$LoadedCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  $Res call({List<Store> storeList, double rad});
}

class __$LoadedCopyWithImpl<$Res> extends _$StoreNearStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object storeList = freezed,
    Object rad = freezed,
  }) {
    return _then(_Loaded(
      storeList == freezed ? _value.storeList : storeList as List<Store>,
      rad == freezed ? _value.rad : rad as double,
    ));
  }
}

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.storeList, this.rad)
      : assert(storeList != null),
        assert(rad != null);

  @override
  final List<Store> storeList;
  @override
  final double rad;

  @override
  String toString() {
    return 'StoreNearState.loaded(storeList: $storeList, rad: $rad)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.storeList, storeList) ||
                const DeepCollectionEquality()
                    .equals(other.storeList, storeList)) &&
            (identical(other.rad, rad) ||
                const DeepCollectionEquality().equals(other.rad, rad)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(storeList) ^
      const DeepCollectionEquality().hash(rad);

  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<Store> previousStoreList),
    @required Result loaded(List<Store> storeList, double rad),
    @required Result failure(StoreFailure f),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return loaded(storeList, rad);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<Store> previousStoreList),
    Result loaded(List<Store> storeList, double rad),
    Result failure(StoreFailure f),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(storeList, rad);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements StoreNearState {
  const factory _Loaded(List<Store> storeList, double rad) = _$_Loaded;

  List<Store> get storeList;
  double get rad;
  _$LoadedCopyWith<_Loaded> get copyWith;
}

abstract class _$FailureCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  $Res call({StoreFailure f});

  $StoreFailureCopyWith<$Res> get f;
}

class __$FailureCopyWithImpl<$Res> extends _$StoreNearStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object f = freezed,
  }) {
    return _then(_Failure(
      f == freezed ? _value.f : f as StoreFailure,
    ));
  }

  @override
  $StoreFailureCopyWith<$Res> get f {
    if (_value.f == null) {
      return null;
    }
    return $StoreFailureCopyWith<$Res>(_value.f, (value) {
      return _then(_value.copyWith(f: value));
    });
  }
}

class _$_Failure implements _Failure {
  const _$_Failure(this.f) : assert(f != null);

  @override
  final StoreFailure f;

  @override
  String toString() {
    return 'StoreNearState.failure(f: $f)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failure &&
            (identical(other.f, f) ||
                const DeepCollectionEquality().equals(other.f, f)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(f);

  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result inital(),
    @required Result loading(List<Store> previousStoreList),
    @required Result loaded(List<Store> storeList, double rad),
    @required Result failure(StoreFailure f),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return failure(f);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result inital(),
    Result loading(List<Store> previousStoreList),
    Result loaded(List<Store> storeList, double rad),
    Result failure(StoreFailure f),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(f);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result inital(_Initial value),
    @required Result loading(_Loading value),
    @required Result loaded(_Loaded value),
    @required Result failure(_Failure value),
  }) {
    assert(inital != null);
    assert(loading != null);
    assert(loaded != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result inital(_Initial value),
    Result loading(_Loading value),
    Result loaded(_Loaded value),
    Result failure(_Failure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements StoreNearState {
  const factory _Failure(StoreFailure f) = _$_Failure;

  StoreFailure get f;
  _$FailureCopyWith<_Failure> get copyWith;
}
