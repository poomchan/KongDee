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
  _Unexpected unexpected() {
    return const _Unexpected();
  }
}

// ignore: unused_element
const $StoreFailure = _$StoreFailureTearOff();

mixin _$StoreFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noStore(),
    @required Result unexpected(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noStore(),
    Result unexpected(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noStore(_NoStoreOwned value),
    @required Result unexpected(_Unexpected value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noStore(_NoStoreOwned value),
    Result unexpected(_Unexpected value),
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
    @required Result unexpected(),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    return noStore();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noStore(),
    Result unexpected(),
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
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    return noStore(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noStore(_NoStoreOwned value),
    Result unexpected(_Unexpected value),
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
}

class __$UnexpectedCopyWithImpl<$Res> extends _$StoreFailureCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(
      _Unexpected _value, $Res Function(_Unexpected) _then)
      : super(_value, (v) => _then(v as _Unexpected));

  @override
  _Unexpected get _value => super._value as _Unexpected;
}

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected();

  @override
  String toString() {
    return 'StoreFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noStore(),
    @required Result unexpected(),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    return unexpected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noStore(),
    Result unexpected(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noStore(_NoStoreOwned value),
    @required Result unexpected(_Unexpected value),
  }) {
    assert(noStore != null);
    assert(unexpected != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noStore(_NoStoreOwned value),
    Result unexpected(_Unexpected value),
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
  const factory _Unexpected() = _$_Unexpected;
}
