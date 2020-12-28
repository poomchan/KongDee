// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MessageDomainTearOff {
  const _$MessageDomainTearOff();

// ignore: unused_element
  _MessageDomain call(
      {@required UniqueId id,
      @required UniqueId senderId,
      @required SenderName senderName,
      @required SenderAvatarUrl senderAvatarUrl,
      @required MessageBody body,
      @required bool isSender,
      Timestamp timestamp}) {
    return _MessageDomain(
      id: id,
      senderId: senderId,
      senderName: senderName,
      senderAvatarUrl: senderAvatarUrl,
      body: body,
      isSender: isSender,
      timestamp: timestamp,
    );
  }
}

// ignore: unused_element
const $MessageDomain = _$MessageDomainTearOff();

mixin _$MessageDomain {
  UniqueId get id;
  UniqueId get senderId;
  SenderName get senderName;
  SenderAvatarUrl get senderAvatarUrl;
  MessageBody get body;
  bool get isSender;
  Timestamp get timestamp;

  $MessageDomainCopyWith<MessageDomain> get copyWith;
}

abstract class $MessageDomainCopyWith<$Res> {
  factory $MessageDomainCopyWith(
          MessageDomain value, $Res Function(MessageDomain) then) =
      _$MessageDomainCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      UniqueId senderId,
      SenderName senderName,
      SenderAvatarUrl senderAvatarUrl,
      MessageBody body,
      bool isSender,
      Timestamp timestamp});
}

class _$MessageDomainCopyWithImpl<$Res>
    implements $MessageDomainCopyWith<$Res> {
  _$MessageDomainCopyWithImpl(this._value, this._then);

  final MessageDomain _value;
  // ignore: unused_field
  final $Res Function(MessageDomain) _then;

  @override
  $Res call({
    Object id = freezed,
    Object senderId = freezed,
    Object senderName = freezed,
    Object senderAvatarUrl = freezed,
    Object body = freezed,
    Object isSender = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      senderId: senderId == freezed ? _value.senderId : senderId as UniqueId,
      senderName:
          senderName == freezed ? _value.senderName : senderName as SenderName,
      senderAvatarUrl: senderAvatarUrl == freezed
          ? _value.senderAvatarUrl
          : senderAvatarUrl as SenderAvatarUrl,
      body: body == freezed ? _value.body : body as MessageBody,
      isSender: isSender == freezed ? _value.isSender : isSender as bool,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }
}

abstract class _$MessageDomainCopyWith<$Res>
    implements $MessageDomainCopyWith<$Res> {
  factory _$MessageDomainCopyWith(
          _MessageDomain value, $Res Function(_MessageDomain) then) =
      __$MessageDomainCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      UniqueId senderId,
      SenderName senderName,
      SenderAvatarUrl senderAvatarUrl,
      MessageBody body,
      bool isSender,
      Timestamp timestamp});
}

class __$MessageDomainCopyWithImpl<$Res>
    extends _$MessageDomainCopyWithImpl<$Res>
    implements _$MessageDomainCopyWith<$Res> {
  __$MessageDomainCopyWithImpl(
      _MessageDomain _value, $Res Function(_MessageDomain) _then)
      : super(_value, (v) => _then(v as _MessageDomain));

  @override
  _MessageDomain get _value => super._value as _MessageDomain;

  @override
  $Res call({
    Object id = freezed,
    Object senderId = freezed,
    Object senderName = freezed,
    Object senderAvatarUrl = freezed,
    Object body = freezed,
    Object isSender = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_MessageDomain(
      id: id == freezed ? _value.id : id as UniqueId,
      senderId: senderId == freezed ? _value.senderId : senderId as UniqueId,
      senderName:
          senderName == freezed ? _value.senderName : senderName as SenderName,
      senderAvatarUrl: senderAvatarUrl == freezed
          ? _value.senderAvatarUrl
          : senderAvatarUrl as SenderAvatarUrl,
      body: body == freezed ? _value.body : body as MessageBody,
      isSender: isSender == freezed ? _value.isSender : isSender as bool,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }
}

class _$_MessageDomain extends _MessageDomain {
  const _$_MessageDomain(
      {@required this.id,
      @required this.senderId,
      @required this.senderName,
      @required this.senderAvatarUrl,
      @required this.body,
      @required this.isSender,
      this.timestamp})
      : assert(id != null),
        assert(senderId != null),
        assert(senderName != null),
        assert(senderAvatarUrl != null),
        assert(body != null),
        assert(isSender != null),
        super._();

  @override
  final UniqueId id;
  @override
  final UniqueId senderId;
  @override
  final SenderName senderName;
  @override
  final SenderAvatarUrl senderAvatarUrl;
  @override
  final MessageBody body;
  @override
  final bool isSender;
  @override
  final Timestamp timestamp;

  @override
  String toString() {
    return 'MessageDomain(id: $id, senderId: $senderId, senderName: $senderName, senderAvatarUrl: $senderAvatarUrl, body: $body, isSender: $isSender, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessageDomain &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.senderId, senderId) ||
                const DeepCollectionEquality()
                    .equals(other.senderId, senderId)) &&
            (identical(other.senderName, senderName) ||
                const DeepCollectionEquality()
                    .equals(other.senderName, senderName)) &&
            (identical(other.senderAvatarUrl, senderAvatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.senderAvatarUrl, senderAvatarUrl)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.isSender, isSender) ||
                const DeepCollectionEquality()
                    .equals(other.isSender, isSender)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(senderId) ^
      const DeepCollectionEquality().hash(senderName) ^
      const DeepCollectionEquality().hash(senderAvatarUrl) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(isSender) ^
      const DeepCollectionEquality().hash(timestamp);

  @override
  _$MessageDomainCopyWith<_MessageDomain> get copyWith =>
      __$MessageDomainCopyWithImpl<_MessageDomain>(this, _$identity);
}

abstract class _MessageDomain extends MessageDomain {
  const _MessageDomain._() : super._();
  const factory _MessageDomain(
      {@required UniqueId id,
      @required UniqueId senderId,
      @required SenderName senderName,
      @required SenderAvatarUrl senderAvatarUrl,
      @required MessageBody body,
      @required bool isSender,
      Timestamp timestamp}) = _$_MessageDomain;

  @override
  UniqueId get id;
  @override
  UniqueId get senderId;
  @override
  SenderName get senderName;
  @override
  SenderAvatarUrl get senderAvatarUrl;
  @override
  MessageBody get body;
  @override
  bool get isSender;
  @override
  Timestamp get timestamp;
  @override
  _$MessageDomainCopyWith<_MessageDomain> get copyWith;
}
