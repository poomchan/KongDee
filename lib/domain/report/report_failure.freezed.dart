// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'report_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ReportFailureTearOff {
  const _$ReportFailureTearOff();

// ignore: unused_element
  _Unexpected unexpected(dynamic err) {
    return _Unexpected(
      err,
    );
  }

// ignore: unused_element
  _ServerError serverError() {
    return const _ServerError();
  }

// ignore: unused_element
  _Timeout timeout() {
    return const _Timeout();
  }
}

// ignore: unused_element
const $ReportFailure = _$ReportFailureTearOff();

mixin _$ReportFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(dynamic err),
    @required Result serverError(),
    @required Result timeout(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(dynamic err),
    Result serverError(),
    Result timeout(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result serverError(_ServerError value),
    @required Result timeout(_Timeout value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result serverError(_ServerError value),
    Result timeout(_Timeout value),
    @required Result orElse(),
  });
}

abstract class $ReportFailureCopyWith<$Res> {
  factory $ReportFailureCopyWith(
          ReportFailure value, $Res Function(ReportFailure) then) =
      _$ReportFailureCopyWithImpl<$Res>;
}

class _$ReportFailureCopyWithImpl<$Res>
    implements $ReportFailureCopyWith<$Res> {
  _$ReportFailureCopyWithImpl(this._value, this._then);

  final ReportFailure _value;
  // ignore: unused_field
  final $Res Function(ReportFailure) _then;
}

abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
  $Res call({dynamic err});
}

class __$UnexpectedCopyWithImpl<$Res> extends _$ReportFailureCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(
      _Unexpected _value, $Res Function(_Unexpected) _then)
      : super(_value, (v) => _then(v as _Unexpected));

  @override
  _Unexpected get _value => super._value as _Unexpected;

  @override
  $Res call({
    Object err = freezed,
  }) {
    return _then(_Unexpected(
      err == freezed ? _value.err : err,
    ));
  }
}

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected(this.err) : assert(err != null);

  @override
  final dynamic err;

  @override
  String toString() {
    return 'ReportFailure.unexpected(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Unexpected &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @override
  _$UnexpectedCopyWith<_Unexpected> get copyWith =>
      __$UnexpectedCopyWithImpl<_Unexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(dynamic err),
    @required Result serverError(),
    @required Result timeout(),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    assert(timeout != null);
    return unexpected(err);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(dynamic err),
    Result serverError(),
    Result timeout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result serverError(_ServerError value),
    @required Result timeout(_Timeout value),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    assert(timeout != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result serverError(_ServerError value),
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

abstract class _Unexpected implements ReportFailure {
  const factory _Unexpected(dynamic err) = _$_Unexpected;

  dynamic get err;
  _$UnexpectedCopyWith<_Unexpected> get copyWith;
}

abstract class _$ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
}

class __$ServerErrorCopyWithImpl<$Res> extends _$ReportFailureCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError _value, $Res Function(_ServerError) _then)
      : super(_value, (v) => _then(v as _ServerError));

  @override
  _ServerError get _value => super._value as _ServerError;
}

class _$_ServerError implements _ServerError {
  const _$_ServerError();

  @override
  String toString() {
    return 'ReportFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(dynamic err),
    @required Result serverError(),
    @required Result timeout(),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    assert(timeout != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(dynamic err),
    Result serverError(),
    Result timeout(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result serverError(_ServerError value),
    @required Result timeout(_Timeout value),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    assert(timeout != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result serverError(_ServerError value),
    Result timeout(_Timeout value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements ReportFailure {
  const factory _ServerError() = _$_ServerError;
}

abstract class _$TimeoutCopyWith<$Res> {
  factory _$TimeoutCopyWith(_Timeout value, $Res Function(_Timeout) then) =
      __$TimeoutCopyWithImpl<$Res>;
}

class __$TimeoutCopyWithImpl<$Res> extends _$ReportFailureCopyWithImpl<$Res>
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
    return 'ReportFailure.timeout()';
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
    @required Result unexpected(dynamic err),
    @required Result serverError(),
    @required Result timeout(),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    assert(timeout != null);
    return timeout();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(dynamic err),
    Result serverError(),
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
    @required Result unexpected(_Unexpected value),
    @required Result serverError(_ServerError value),
    @required Result timeout(_Timeout value),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    assert(timeout != null);
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result serverError(_ServerError value),
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

abstract class _Timeout implements ReportFailure {
  const factory _Timeout() = _$_Timeout;
}
