// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'info_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$InfoFailureTearOff {
  const _$InfoFailureTearOff();

// ignore: unused_element
  NoInfo noInfo() {
    return const NoInfo();
  }

// ignore: unused_element
  ServerFailure serverFailure() {
    return const ServerFailure();
  }

// ignore: unused_element
  Unexpected unexpected(dynamic err) {
    return Unexpected(
      err,
    );
  }
}

// ignore: unused_element
const $InfoFailure = _$InfoFailureTearOff();

mixin _$InfoFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noInfo(),
    @required Result serverFailure(),
    @required Result unexpected(dynamic err),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noInfo(),
    Result serverFailure(),
    Result unexpected(dynamic err),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noInfo(NoInfo value),
    @required Result serverFailure(ServerFailure value),
    @required Result unexpected(Unexpected value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noInfo(NoInfo value),
    Result serverFailure(ServerFailure value),
    Result unexpected(Unexpected value),
    @required Result orElse(),
  });
}

abstract class $InfoFailureCopyWith<$Res> {
  factory $InfoFailureCopyWith(
          InfoFailure value, $Res Function(InfoFailure) then) =
      _$InfoFailureCopyWithImpl<$Res>;
}

class _$InfoFailureCopyWithImpl<$Res> implements $InfoFailureCopyWith<$Res> {
  _$InfoFailureCopyWithImpl(this._value, this._then);

  final InfoFailure _value;
  // ignore: unused_field
  final $Res Function(InfoFailure) _then;
}

abstract class $NoInfoCopyWith<$Res> {
  factory $NoInfoCopyWith(NoInfo value, $Res Function(NoInfo) then) =
      _$NoInfoCopyWithImpl<$Res>;
}

class _$NoInfoCopyWithImpl<$Res> extends _$InfoFailureCopyWithImpl<$Res>
    implements $NoInfoCopyWith<$Res> {
  _$NoInfoCopyWithImpl(NoInfo _value, $Res Function(NoInfo) _then)
      : super(_value, (v) => _then(v as NoInfo));

  @override
  NoInfo get _value => super._value as NoInfo;
}

class _$NoInfo implements NoInfo {
  const _$NoInfo();

  @override
  String toString() {
    return 'InfoFailure.noInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoInfo);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noInfo(),
    @required Result serverFailure(),
    @required Result unexpected(dynamic err),
  }) {
    assert(noInfo != null);
    assert(serverFailure != null);
    assert(unexpected != null);
    return noInfo();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noInfo(),
    Result serverFailure(),
    Result unexpected(dynamic err),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noInfo != null) {
      return noInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noInfo(NoInfo value),
    @required Result serverFailure(ServerFailure value),
    @required Result unexpected(Unexpected value),
  }) {
    assert(noInfo != null);
    assert(serverFailure != null);
    assert(unexpected != null);
    return noInfo(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noInfo(NoInfo value),
    Result serverFailure(ServerFailure value),
    Result unexpected(Unexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noInfo != null) {
      return noInfo(this);
    }
    return orElse();
  }
}

abstract class NoInfo implements InfoFailure {
  const factory NoInfo() = _$NoInfo;
}

abstract class $ServerFailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(
          ServerFailure value, $Res Function(ServerFailure) then) =
      _$ServerFailureCopyWithImpl<$Res>;
}

class _$ServerFailureCopyWithImpl<$Res> extends _$InfoFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(
      ServerFailure _value, $Res Function(ServerFailure) _then)
      : super(_value, (v) => _then(v as ServerFailure));

  @override
  ServerFailure get _value => super._value as ServerFailure;
}

class _$ServerFailure implements ServerFailure {
  const _$ServerFailure();

  @override
  String toString() {
    return 'InfoFailure.serverFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noInfo(),
    @required Result serverFailure(),
    @required Result unexpected(dynamic err),
  }) {
    assert(noInfo != null);
    assert(serverFailure != null);
    assert(unexpected != null);
    return serverFailure();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noInfo(),
    Result serverFailure(),
    Result unexpected(dynamic err),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverFailure != null) {
      return serverFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result noInfo(NoInfo value),
    @required Result serverFailure(ServerFailure value),
    @required Result unexpected(Unexpected value),
  }) {
    assert(noInfo != null);
    assert(serverFailure != null);
    assert(unexpected != null);
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noInfo(NoInfo value),
    Result serverFailure(ServerFailure value),
    Result unexpected(Unexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements InfoFailure {
  const factory ServerFailure() = _$ServerFailure;
}

abstract class $UnexpectedCopyWith<$Res> {
  factory $UnexpectedCopyWith(
          Unexpected value, $Res Function(Unexpected) then) =
      _$UnexpectedCopyWithImpl<$Res>;
  $Res call({dynamic err});
}

class _$UnexpectedCopyWithImpl<$Res> extends _$InfoFailureCopyWithImpl<$Res>
    implements $UnexpectedCopyWith<$Res> {
  _$UnexpectedCopyWithImpl(Unexpected _value, $Res Function(Unexpected) _then)
      : super(_value, (v) => _then(v as Unexpected));

  @override
  Unexpected get _value => super._value as Unexpected;

  @override
  $Res call({
    Object err = freezed,
  }) {
    return _then(Unexpected(
      err == freezed ? _value.err : err as dynamic,
    ));
  }
}

class _$Unexpected implements Unexpected {
  const _$Unexpected(this.err) : assert(err != null);

  @override
  final dynamic err;

  @override
  String toString() {
    return 'InfoFailure.unexpected(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Unexpected &&
            (identical(other.err, err) ||
                const DeepCollectionEquality().equals(other.err, err)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(err);

  @override
  $UnexpectedCopyWith<Unexpected> get copyWith =>
      _$UnexpectedCopyWithImpl<Unexpected>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result noInfo(),
    @required Result serverFailure(),
    @required Result unexpected(dynamic err),
  }) {
    assert(noInfo != null);
    assert(serverFailure != null);
    assert(unexpected != null);
    return unexpected(err);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result noInfo(),
    Result serverFailure(),
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
    @required Result noInfo(NoInfo value),
    @required Result serverFailure(ServerFailure value),
    @required Result unexpected(Unexpected value),
  }) {
    assert(noInfo != null);
    assert(serverFailure != null);
    assert(unexpected != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result noInfo(NoInfo value),
    Result serverFailure(ServerFailure value),
    Result unexpected(Unexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected implements InfoFailure {
  const factory Unexpected(dynamic err) = _$Unexpected;

  dynamic get err;
  $UnexpectedCopyWith<Unexpected> get copyWith;
}
