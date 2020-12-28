// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

// ignore: unused_element
  _Unauthenticated unauthenticated() {
    return const _Unauthenticated();
  }

// ignore: unused_element
  _SeverError serverError() {
    return const _SeverError();
  }

// ignore: unused_element
  _CancleByUser cancleByUser() {
    return const _CancleByUser();
  }

// ignore: unused_element
  _Unexpected unexpected(dynamic err) {
    return _Unexpected(
      err,
    );
  }
}

// ignore: unused_element
const $AuthFailure = _$AuthFailureTearOff();

mixin _$AuthFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unauthenticated(),
    @required Result serverError(),
    @required Result cancleByUser(),
    @required Result unexpected(dynamic err),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unauthenticated(),
    Result serverError(),
    Result cancleByUser(),
    Result unexpected(dynamic err),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unauthenticated(_Unauthenticated value),
    @required Result serverError(_SeverError value),
    @required Result cancleByUser(_CancleByUser value),
    @required Result unexpected(_Unexpected value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unauthenticated(_Unauthenticated value),
    Result serverError(_SeverError value),
    Result cancleByUser(_CancleByUser value),
    Result unexpected(_Unexpected value),
    @required Result orElse(),
  });
}

abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

abstract class _$UnauthenticatedCopyWith<$Res> {
  factory _$UnauthenticatedCopyWith(
          _Unauthenticated value, $Res Function(_Unauthenticated) then) =
      __$UnauthenticatedCopyWithImpl<$Res>;
}

class __$UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements _$UnauthenticatedCopyWith<$Res> {
  __$UnauthenticatedCopyWithImpl(
      _Unauthenticated _value, $Res Function(_Unauthenticated) _then)
      : super(_value, (v) => _then(v as _Unauthenticated));

  @override
  _Unauthenticated get _value => super._value as _Unauthenticated;
}

class _$_Unauthenticated
    with DiagnosticableTreeMixin
    implements _Unauthenticated {
  const _$_Unauthenticated();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.unauthenticated()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthFailure.unauthenticated'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unauthenticated(),
    @required Result serverError(),
    @required Result cancleByUser(),
    @required Result unexpected(dynamic err),
  }) {
    assert(unauthenticated != null);
    assert(serverError != null);
    assert(cancleByUser != null);
    assert(unexpected != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unauthenticated(),
    Result serverError(),
    Result cancleByUser(),
    Result unexpected(dynamic err),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unauthenticated(_Unauthenticated value),
    @required Result serverError(_SeverError value),
    @required Result cancleByUser(_CancleByUser value),
    @required Result unexpected(_Unexpected value),
  }) {
    assert(unauthenticated != null);
    assert(serverError != null);
    assert(cancleByUser != null);
    assert(unexpected != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unauthenticated(_Unauthenticated value),
    Result serverError(_SeverError value),
    Result cancleByUser(_CancleByUser value),
    Result unexpected(_Unexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthFailure {
  const factory _Unauthenticated() = _$_Unauthenticated;
}

abstract class _$SeverErrorCopyWith<$Res> {
  factory _$SeverErrorCopyWith(
          _SeverError value, $Res Function(_SeverError) then) =
      __$SeverErrorCopyWithImpl<$Res>;
}

class __$SeverErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$SeverErrorCopyWith<$Res> {
  __$SeverErrorCopyWithImpl(
      _SeverError _value, $Res Function(_SeverError) _then)
      : super(_value, (v) => _then(v as _SeverError));

  @override
  _SeverError get _value => super._value as _SeverError;
}

class _$_SeverError with DiagnosticableTreeMixin implements _SeverError {
  const _$_SeverError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.serverError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthFailure.serverError'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SeverError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unauthenticated(),
    @required Result serverError(),
    @required Result cancleByUser(),
    @required Result unexpected(dynamic err),
  }) {
    assert(unauthenticated != null);
    assert(serverError != null);
    assert(cancleByUser != null);
    assert(unexpected != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unauthenticated(),
    Result serverError(),
    Result cancleByUser(),
    Result unexpected(dynamic err),
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
    @required Result unauthenticated(_Unauthenticated value),
    @required Result serverError(_SeverError value),
    @required Result cancleByUser(_CancleByUser value),
    @required Result unexpected(_Unexpected value),
  }) {
    assert(unauthenticated != null);
    assert(serverError != null);
    assert(cancleByUser != null);
    assert(unexpected != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unauthenticated(_Unauthenticated value),
    Result serverError(_SeverError value),
    Result cancleByUser(_CancleByUser value),
    Result unexpected(_Unexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _SeverError implements AuthFailure {
  const factory _SeverError() = _$_SeverError;
}

abstract class _$CancleByUserCopyWith<$Res> {
  factory _$CancleByUserCopyWith(
          _CancleByUser value, $Res Function(_CancleByUser) then) =
      __$CancleByUserCopyWithImpl<$Res>;
}

class __$CancleByUserCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements _$CancleByUserCopyWith<$Res> {
  __$CancleByUserCopyWithImpl(
      _CancleByUser _value, $Res Function(_CancleByUser) _then)
      : super(_value, (v) => _then(v as _CancleByUser));

  @override
  _CancleByUser get _value => super._value as _CancleByUser;
}

class _$_CancleByUser with DiagnosticableTreeMixin implements _CancleByUser {
  const _$_CancleByUser();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.cancleByUser()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AuthFailure.cancleByUser'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _CancleByUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unauthenticated(),
    @required Result serverError(),
    @required Result cancleByUser(),
    @required Result unexpected(dynamic err),
  }) {
    assert(unauthenticated != null);
    assert(serverError != null);
    assert(cancleByUser != null);
    assert(unexpected != null);
    return cancleByUser();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unauthenticated(),
    Result serverError(),
    Result cancleByUser(),
    Result unexpected(dynamic err),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cancleByUser != null) {
      return cancleByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unauthenticated(_Unauthenticated value),
    @required Result serverError(_SeverError value),
    @required Result cancleByUser(_CancleByUser value),
    @required Result unexpected(_Unexpected value),
  }) {
    assert(unauthenticated != null);
    assert(serverError != null);
    assert(cancleByUser != null);
    assert(unexpected != null);
    return cancleByUser(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unauthenticated(_Unauthenticated value),
    Result serverError(_SeverError value),
    Result cancleByUser(_CancleByUser value),
    Result unexpected(_Unexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cancleByUser != null) {
      return cancleByUser(this);
    }
    return orElse();
  }
}

abstract class _CancleByUser implements AuthFailure {
  const factory _CancleByUser() = _$_CancleByUser;
}

abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
  $Res call({dynamic err});
}

class __$UnexpectedCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
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
      err == freezed ? _value.err : err as dynamic,
    ));
  }
}

class _$_Unexpected with DiagnosticableTreeMixin implements _Unexpected {
  const _$_Unexpected(this.err) : assert(err != null);

  @override
  final dynamic err;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthFailure.unexpected(err: $err)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthFailure.unexpected'))
      ..add(DiagnosticsProperty('err', err));
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
    @required Result unauthenticated(),
    @required Result serverError(),
    @required Result cancleByUser(),
    @required Result unexpected(dynamic err),
  }) {
    assert(unauthenticated != null);
    assert(serverError != null);
    assert(cancleByUser != null);
    assert(unexpected != null);
    return unexpected(err);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unauthenticated(),
    Result serverError(),
    Result cancleByUser(),
    Result unexpected(dynamic err),
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
    @required Result unauthenticated(_Unauthenticated value),
    @required Result serverError(_SeverError value),
    @required Result cancleByUser(_CancleByUser value),
    @required Result unexpected(_Unexpected value),
  }) {
    assert(unauthenticated != null);
    assert(serverError != null);
    assert(cancleByUser != null);
    assert(unexpected != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unauthenticated(_Unauthenticated value),
    Result serverError(_SeverError value),
    Result cancleByUser(_CancleByUser value),
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

abstract class _Unexpected implements AuthFailure {
  const factory _Unexpected(dynamic err) = _$_Unexpected;

  dynamic get err;
  _$UnexpectedCopyWith<_Unexpected> get copyWith;
}
