// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'image_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ImageFailureTearOff {
  const _$ImageFailureTearOff();

// ignore: unused_element
  _ServerError serverError() {
    return const _ServerError();
  }

// ignore: unused_element
  _Unexpected unexpected(dynamic detail) {
    return _Unexpected(
      detail,
    );
  }
}

// ignore: unused_element
const $ImageFailure = _$ImageFailureTearOff();

mixin _$ImageFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result unexpected(dynamic detail),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result unexpected(dynamic detail),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(_ServerError value),
    @required Result unexpected(_Unexpected value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError value),
    Result unexpected(_Unexpected value),
    @required Result orElse(),
  });
}

abstract class $ImageFailureCopyWith<$Res> {
  factory $ImageFailureCopyWith(
          ImageFailure value, $Res Function(ImageFailure) then) =
      _$ImageFailureCopyWithImpl<$Res>;
}

class _$ImageFailureCopyWithImpl<$Res> implements $ImageFailureCopyWith<$Res> {
  _$ImageFailureCopyWithImpl(this._value, this._then);

  final ImageFailure _value;
  // ignore: unused_field
  final $Res Function(ImageFailure) _then;
}

abstract class _$ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
}

class __$ServerErrorCopyWithImpl<$Res> extends _$ImageFailureCopyWithImpl<$Res>
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
    return 'ImageFailure.serverError()';
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
    @required Result serverError(),
    @required Result unexpected(dynamic detail),
  }) {
    assert(serverError != null);
    assert(unexpected != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result unexpected(dynamic detail),
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
    @required Result serverError(_ServerError value),
    @required Result unexpected(_Unexpected value),
  }) {
    assert(serverError != null);
    assert(unexpected != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError value),
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

abstract class _ServerError implements ImageFailure {
  const factory _ServerError() = _$_ServerError;
}

abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
  $Res call({dynamic detail});
}

class __$UnexpectedCopyWithImpl<$Res> extends _$ImageFailureCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(
      _Unexpected _value, $Res Function(_Unexpected) _then)
      : super(_value, (v) => _then(v as _Unexpected));

  @override
  _Unexpected get _value => super._value as _Unexpected;

  @override
  $Res call({
    Object detail = freezed,
  }) {
    return _then(_Unexpected(
      detail == freezed ? _value.detail : detail as dynamic,
    ));
  }
}

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected(this.detail) : assert(detail != null);

  @override
  final dynamic detail;

  @override
  String toString() {
    return 'ImageFailure.unexpected(detail: $detail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Unexpected &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(detail);

  @override
  _$UnexpectedCopyWith<_Unexpected> get copyWith =>
      __$UnexpectedCopyWithImpl<_Unexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result unexpected(dynamic detail),
  }) {
    assert(serverError != null);
    assert(unexpected != null);
    return unexpected(detail);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result unexpected(dynamic detail),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(detail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(_ServerError value),
    @required Result unexpected(_Unexpected value),
  }) {
    assert(serverError != null);
    assert(unexpected != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError value),
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

abstract class _Unexpected implements ImageFailure {
  const factory _Unexpected(dynamic detail) = _$_Unexpected;

  dynamic get detail;
  _$UnexpectedCopyWith<_Unexpected> get copyWith;
}
