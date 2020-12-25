// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'message_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MessageFailureTearOff {
  const _$MessageFailureTearOff();

// ignore: unused_element
  _Unexpected unexpected(dynamic detail) {
    return _Unexpected(
      detail,
    );
  }

// ignore: unused_element
  _SeverFailure severFailure() {
    return const _SeverFailure();
  }

// ignore: unused_element
  _NoSuchMessage noSuchMessage() {
    return const _NoSuchMessage();
  }

// ignore: unused_element
  _EmptyChatRoom emptyChatRoom() {
    return const _EmptyChatRoom();
  }
}

// ignore: unused_element
const $MessageFailure = _$MessageFailureTearOff();

mixin _$MessageFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(dynamic detail),
    @required Result severFailure(),
    @required Result noSuchMessage(),
    @required Result emptyChatRoom(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(dynamic detail),
    Result severFailure(),
    Result noSuchMessage(),
    Result emptyChatRoom(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result severFailure(_SeverFailure value),
    @required Result noSuchMessage(_NoSuchMessage value),
    @required Result emptyChatRoom(_EmptyChatRoom value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result severFailure(_SeverFailure value),
    Result noSuchMessage(_NoSuchMessage value),
    Result emptyChatRoom(_EmptyChatRoom value),
    @required Result orElse(),
  });
}

abstract class $MessageFailureCopyWith<$Res> {
  factory $MessageFailureCopyWith(
          MessageFailure value, $Res Function(MessageFailure) then) =
      _$MessageFailureCopyWithImpl<$Res>;
}

class _$MessageFailureCopyWithImpl<$Res>
    implements $MessageFailureCopyWith<$Res> {
  _$MessageFailureCopyWithImpl(this._value, this._then);

  final MessageFailure _value;
  // ignore: unused_field
  final $Res Function(MessageFailure) _then;
}

abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
  $Res call({dynamic detail});
}

class __$UnexpectedCopyWithImpl<$Res> extends _$MessageFailureCopyWithImpl<$Res>
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
    return 'MessageFailure.unexpected(detail: $detail)';
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
    @required Result unexpected(dynamic detail),
    @required Result severFailure(),
    @required Result noSuchMessage(),
    @required Result emptyChatRoom(),
  }) {
    assert(unexpected != null);
    assert(severFailure != null);
    assert(noSuchMessage != null);
    assert(emptyChatRoom != null);
    return unexpected(detail);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(dynamic detail),
    Result severFailure(),
    Result noSuchMessage(),
    Result emptyChatRoom(),
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
    @required Result unexpected(_Unexpected value),
    @required Result severFailure(_SeverFailure value),
    @required Result noSuchMessage(_NoSuchMessage value),
    @required Result emptyChatRoom(_EmptyChatRoom value),
  }) {
    assert(unexpected != null);
    assert(severFailure != null);
    assert(noSuchMessage != null);
    assert(emptyChatRoom != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result severFailure(_SeverFailure value),
    Result noSuchMessage(_NoSuchMessage value),
    Result emptyChatRoom(_EmptyChatRoom value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements MessageFailure {
  const factory _Unexpected(dynamic detail) = _$_Unexpected;

  dynamic get detail;
  _$UnexpectedCopyWith<_Unexpected> get copyWith;
}

abstract class _$SeverFailureCopyWith<$Res> {
  factory _$SeverFailureCopyWith(
          _SeverFailure value, $Res Function(_SeverFailure) then) =
      __$SeverFailureCopyWithImpl<$Res>;
}

class __$SeverFailureCopyWithImpl<$Res>
    extends _$MessageFailureCopyWithImpl<$Res>
    implements _$SeverFailureCopyWith<$Res> {
  __$SeverFailureCopyWithImpl(
      _SeverFailure _value, $Res Function(_SeverFailure) _then)
      : super(_value, (v) => _then(v as _SeverFailure));

  @override
  _SeverFailure get _value => super._value as _SeverFailure;
}

class _$_SeverFailure implements _SeverFailure {
  const _$_SeverFailure();

  @override
  String toString() {
    return 'MessageFailure.severFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SeverFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(dynamic detail),
    @required Result severFailure(),
    @required Result noSuchMessage(),
    @required Result emptyChatRoom(),
  }) {
    assert(unexpected != null);
    assert(severFailure != null);
    assert(noSuchMessage != null);
    assert(emptyChatRoom != null);
    return severFailure();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(dynamic detail),
    Result severFailure(),
    Result noSuchMessage(),
    Result emptyChatRoom(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (severFailure != null) {
      return severFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result severFailure(_SeverFailure value),
    @required Result noSuchMessage(_NoSuchMessage value),
    @required Result emptyChatRoom(_EmptyChatRoom value),
  }) {
    assert(unexpected != null);
    assert(severFailure != null);
    assert(noSuchMessage != null);
    assert(emptyChatRoom != null);
    return severFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result severFailure(_SeverFailure value),
    Result noSuchMessage(_NoSuchMessage value),
    Result emptyChatRoom(_EmptyChatRoom value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (severFailure != null) {
      return severFailure(this);
    }
    return orElse();
  }
}

abstract class _SeverFailure implements MessageFailure {
  const factory _SeverFailure() = _$_SeverFailure;
}

abstract class _$NoSuchMessageCopyWith<$Res> {
  factory _$NoSuchMessageCopyWith(
          _NoSuchMessage value, $Res Function(_NoSuchMessage) then) =
      __$NoSuchMessageCopyWithImpl<$Res>;
}

class __$NoSuchMessageCopyWithImpl<$Res>
    extends _$MessageFailureCopyWithImpl<$Res>
    implements _$NoSuchMessageCopyWith<$Res> {
  __$NoSuchMessageCopyWithImpl(
      _NoSuchMessage _value, $Res Function(_NoSuchMessage) _then)
      : super(_value, (v) => _then(v as _NoSuchMessage));

  @override
  _NoSuchMessage get _value => super._value as _NoSuchMessage;
}

class _$_NoSuchMessage implements _NoSuchMessage {
  const _$_NoSuchMessage();

  @override
  String toString() {
    return 'MessageFailure.noSuchMessage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NoSuchMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(dynamic detail),
    @required Result severFailure(),
    @required Result noSuchMessage(),
    @required Result emptyChatRoom(),
  }) {
    assert(unexpected != null);
    assert(severFailure != null);
    assert(noSuchMessage != null);
    assert(emptyChatRoom != null);
    return noSuchMessage();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(dynamic detail),
    Result severFailure(),
    Result noSuchMessage(),
    Result emptyChatRoom(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noSuchMessage != null) {
      return noSuchMessage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result severFailure(_SeverFailure value),
    @required Result noSuchMessage(_NoSuchMessage value),
    @required Result emptyChatRoom(_EmptyChatRoom value),
  }) {
    assert(unexpected != null);
    assert(severFailure != null);
    assert(noSuchMessage != null);
    assert(emptyChatRoom != null);
    return noSuchMessage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result severFailure(_SeverFailure value),
    Result noSuchMessage(_NoSuchMessage value),
    Result emptyChatRoom(_EmptyChatRoom value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noSuchMessage != null) {
      return noSuchMessage(this);
    }
    return orElse();
  }
}

abstract class _NoSuchMessage implements MessageFailure {
  const factory _NoSuchMessage() = _$_NoSuchMessage;
}

abstract class _$EmptyChatRoomCopyWith<$Res> {
  factory _$EmptyChatRoomCopyWith(
          _EmptyChatRoom value, $Res Function(_EmptyChatRoom) then) =
      __$EmptyChatRoomCopyWithImpl<$Res>;
}

class __$EmptyChatRoomCopyWithImpl<$Res>
    extends _$MessageFailureCopyWithImpl<$Res>
    implements _$EmptyChatRoomCopyWith<$Res> {
  __$EmptyChatRoomCopyWithImpl(
      _EmptyChatRoom _value, $Res Function(_EmptyChatRoom) _then)
      : super(_value, (v) => _then(v as _EmptyChatRoom));

  @override
  _EmptyChatRoom get _value => super._value as _EmptyChatRoom;
}

class _$_EmptyChatRoom implements _EmptyChatRoom {
  const _$_EmptyChatRoom();

  @override
  String toString() {
    return 'MessageFailure.emptyChatRoom()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EmptyChatRoom);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(dynamic detail),
    @required Result severFailure(),
    @required Result noSuchMessage(),
    @required Result emptyChatRoom(),
  }) {
    assert(unexpected != null);
    assert(severFailure != null);
    assert(noSuchMessage != null);
    assert(emptyChatRoom != null);
    return emptyChatRoom();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(dynamic detail),
    Result severFailure(),
    Result noSuchMessage(),
    Result emptyChatRoom(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyChatRoom != null) {
      return emptyChatRoom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result severFailure(_SeverFailure value),
    @required Result noSuchMessage(_NoSuchMessage value),
    @required Result emptyChatRoom(_EmptyChatRoom value),
  }) {
    assert(unexpected != null);
    assert(severFailure != null);
    assert(noSuchMessage != null);
    assert(emptyChatRoom != null);
    return emptyChatRoom(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result severFailure(_SeverFailure value),
    Result noSuchMessage(_NoSuchMessage value),
    Result emptyChatRoom(_EmptyChatRoom value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyChatRoom != null) {
      return emptyChatRoom(this);
    }
    return orElse();
  }
}

abstract class _EmptyChatRoom implements MessageFailure {
  const factory _EmptyChatRoom() = _$_EmptyChatRoom;
}
