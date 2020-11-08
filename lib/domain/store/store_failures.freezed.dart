// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'store_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StoreFailureTearOff {
  const _$StoreFailureTearOff();

// ignore: unused_element
  _NoStoreOwned noStore() {
    return const _NoStoreOwned();
  }

// ignore: unused_element
  _Unexpected unexpected(dynamic e) {
    return _Unexpected(
      e,
    );
  }

// ignore: unused_element
  _LocationNotGranted locationNotGranted() {
    return const _LocationNotGranted();
  }

// ignore: unused_element
  _Timeout timeout() {
    return const _Timeout();
  }
}

// ignore: unused_element
const $StoreFailure = _$StoreFailureTearOff();

mixin _$StoreFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noStore(),
    @required Result unexpected(dynamic e),
    @required Result locationNotGranted(),
    @required Result timeout(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noStore(),
    Result unexpected(dynamic e),
    Result locationNotGranted(),
    Result timeout(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noStore(_NoStoreOwned value),
    @required Result unexpected(_Unexpected value),
    @required Result locationNotGranted(_LocationNotGranted value),
    @required Result timeout(_Timeout value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noStore(_NoStoreOwned value),
    Result unexpected(_Unexpected value),
    Result locationNotGranted(_LocationNotGranted value),
    Result timeout(_Timeout value),
    @required Result orElse(),
  });
}

abstract class $StoreFailureCopyWith<$Res> {
  factory $StoreFailureCopyWith(
          StoreFailure value, $Res Function(StoreFailure) then) =
      _$StoreFailureCopyWithImpl<$Res>;
}

class _$StoreFailureCopyWithImpl<$Res> implements $StoreFailureCopyWith<$Res> {
  _$StoreFailureCopyWithImpl(this._value, this._then);

  final StoreFailure _value;
  // ignore: unused_field
  final $Res Function(StoreFailure) _then;
}

abstract class _$NoStoreOwnedCopyWith<$Res> {
  factory _$NoStoreOwnedCopyWith(
          _NoStoreOwned value, $Res Function(_NoStoreOwned) then) =
      __$NoStoreOwnedCopyWithImpl<$Res>;
}

class __$NoStoreOwnedCopyWithImpl<$Res> extends _$StoreFailureCopyWithImpl<$Res>
    implements _$NoStoreOwnedCopyWith<$Res> {
  __$NoStoreOwnedCopyWithImpl(
      _NoStoreOwned _value, $Res Function(_NoStoreOwned) _then)
      : super(_value, (v) => _then(v as _NoStoreOwned));

  @override
  _NoStoreOwned get _value => super._value as _NoStoreOwned;
}

class _$_NoStoreOwned implements _NoStoreOwned {
  const _$_NoStoreOwned();

  @override
  String toString() {
    return 'StoreFailure.noStore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NoStoreOwned);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noStore(),
    @required Result unexpected(dynamic e),
    @required Result locationNotGranted(),
    @required Result timeout(),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    assert(locationNotGranted != null);
    assert(timeout != null);
    return noStore();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noStore(),
    Result unexpected(dynamic e),
    Result locationNotGranted(),
    Result timeout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noStore != null) {
      return noStore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noStore(_NoStoreOwned value),
    @required Result unexpected(_Unexpected value),
    @required Result locationNotGranted(_LocationNotGranted value),
    @required Result timeout(_Timeout value),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    assert(locationNotGranted != null);
    assert(timeout != null);
    return noStore(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noStore(_NoStoreOwned value),
    Result unexpected(_Unexpected value),
    Result locationNotGranted(_LocationNotGranted value),
    Result timeout(_Timeout value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noStore != null) {
      return noStore(this);
    }
    return orElse();
  }
}

abstract class _NoStoreOwned implements StoreFailure {
  const factory _NoStoreOwned() = _$_NoStoreOwned;
}

abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
  $Res call({dynamic e});
}

class __$UnexpectedCopyWithImpl<$Res> extends _$StoreFailureCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(
      _Unexpected _value, $Res Function(_Unexpected) _then)
      : super(_value, (v) => _then(v as _Unexpected));

  @override
  _Unexpected get _value => super._value as _Unexpected;

  @override
  $Res call({
    Object e = freezed,
  }) {
    return _then(_Unexpected(
      e == freezed ? _value.e : e,
    ));
  }
}

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected(this.e) : assert(e != null);

  @override
  final dynamic e;

  @override
  String toString() {
    return 'StoreFailure.unexpected(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Unexpected &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @override
  _$UnexpectedCopyWith<_Unexpected> get copyWith =>
      __$UnexpectedCopyWithImpl<_Unexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noStore(),
    @required Result unexpected(dynamic e),
    @required Result locationNotGranted(),
    @required Result timeout(),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    assert(locationNotGranted != null);
    assert(timeout != null);
    return unexpected(e);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noStore(),
    Result unexpected(dynamic e),
    Result locationNotGranted(),
    Result timeout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noStore(_NoStoreOwned value),
    @required Result unexpected(_Unexpected value),
    @required Result locationNotGranted(_LocationNotGranted value),
    @required Result timeout(_Timeout value),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    assert(locationNotGranted != null);
    assert(timeout != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noStore(_NoStoreOwned value),
    Result unexpected(_Unexpected value),
    Result locationNotGranted(_LocationNotGranted value),
    Result timeout(_Timeout value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements StoreFailure {
  const factory _Unexpected(dynamic e) = _$_Unexpected;

  dynamic get e;
  _$UnexpectedCopyWith<_Unexpected> get copyWith;
}

abstract class _$LocationNotGrantedCopyWith<$Res> {
  factory _$LocationNotGrantedCopyWith(
          _LocationNotGranted value, $Res Function(_LocationNotGranted) then) =
      __$LocationNotGrantedCopyWithImpl<$Res>;
}

class __$LocationNotGrantedCopyWithImpl<$Res>
    extends _$StoreFailureCopyWithImpl<$Res>
    implements _$LocationNotGrantedCopyWith<$Res> {
  __$LocationNotGrantedCopyWithImpl(
      _LocationNotGranted _value, $Res Function(_LocationNotGranted) _then)
      : super(_value, (v) => _then(v as _LocationNotGranted));

  @override
  _LocationNotGranted get _value => super._value as _LocationNotGranted;
}

class _$_LocationNotGranted implements _LocationNotGranted {
  const _$_LocationNotGranted();

  @override
  String toString() {
    return 'StoreFailure.locationNotGranted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LocationNotGranted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noStore(),
    @required Result unexpected(dynamic e),
    @required Result locationNotGranted(),
    @required Result timeout(),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    assert(locationNotGranted != null);
    assert(timeout != null);
    return locationNotGranted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noStore(),
    Result unexpected(dynamic e),
    Result locationNotGranted(),
    Result timeout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (locationNotGranted != null) {
      return locationNotGranted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noStore(_NoStoreOwned value),
    @required Result unexpected(_Unexpected value),
    @required Result locationNotGranted(_LocationNotGranted value),
    @required Result timeout(_Timeout value),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    assert(locationNotGranted != null);
    assert(timeout != null);
    return locationNotGranted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noStore(_NoStoreOwned value),
    Result unexpected(_Unexpected value),
    Result locationNotGranted(_LocationNotGranted value),
    Result timeout(_Timeout value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (locationNotGranted != null) {
      return locationNotGranted(this);
    }
    return orElse();
  }
}

abstract class _LocationNotGranted implements StoreFailure {
  const factory _LocationNotGranted() = _$_LocationNotGranted;
}

abstract class _$TimeoutCopyWith<$Res> {
  factory _$TimeoutCopyWith(_Timeout value, $Res Function(_Timeout) then) =
      __$TimeoutCopyWithImpl<$Res>;
}

class __$TimeoutCopyWithImpl<$Res> extends _$StoreFailureCopyWithImpl<$Res>
    implements _$TimeoutCopyWith<$Res> {
  __$TimeoutCopyWithImpl(_Timeout _value, $Res Function(_Timeout) _then)
      : super(_value, (v) => _then(v as _Timeout));

  @override
  _Timeout get _value => super._value as _Timeout;
}

class _$_Timeout implements _Timeout {
  const _$_Timeout();

  @override
  String toString() {
    return 'StoreFailure.timeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Timeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noStore(),
    @required Result unexpected(dynamic e),
    @required Result locationNotGranted(),
    @required Result timeout(),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    assert(locationNotGranted != null);
    assert(timeout != null);
    return timeout();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noStore(),
    Result unexpected(dynamic e),
    Result locationNotGranted(),
    Result timeout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noStore(_NoStoreOwned value),
    @required Result unexpected(_Unexpected value),
    @required Result locationNotGranted(_LocationNotGranted value),
    @required Result timeout(_Timeout value),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    assert(locationNotGranted != null);
    assert(timeout != null);
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noStore(_NoStoreOwned value),
    Result unexpected(_Unexpected value),
    Result locationNotGranted(_LocationNotGranted value),
    Result timeout(_Timeout value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _Timeout implements StoreFailure {
  const factory _Timeout() = _$_Timeout;
}
