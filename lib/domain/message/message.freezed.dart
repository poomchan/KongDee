// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MessageDomain _$MessageDomainFromJson(Map<String, dynamic> json) {
  return _MessageDomain.fromJson(json);
}

class _$MessageDomainTearOff {
  const _$MessageDomainTearOff();

// ignore: unused_element
  _MessageDomain call(
      {@JsonKey(ignore: true) String id,
      @required String senderId,
      @JsonKey(ignore: true) bool isSender,
      @required String senderName,
      @required String senderAvatarUrl,
      @required String body,
      @TimestampConverter() Timestamp timestamp}) {
    return _MessageDomain(
      id: id,
      senderId: senderId,
      isSender: isSender,
      senderName: senderName,
      senderAvatarUrl: senderAvatarUrl,
      body: body,
      timestamp: timestamp,
    );
  }
}

// ignore: unused_element
const $MessageDomain = _$MessageDomainTearOff();

mixin _$MessageDomain {
  @JsonKey(ignore: true)
  String get id;
  String get senderId;
  @JsonKey(ignore: true)
  bool get isSender;
  String get senderName;
  String get senderAvatarUrl;
  String get body;
  @TimestampConverter()
  Timestamp get timestamp;

  Map<String, dynamic> toJson();
  $MessageDomainCopyWith<MessageDomain> get copyWith;
}

abstract class $MessageDomainCopyWith<$Res> {
  factory $MessageDomainCopyWith(
          MessageDomain value, $Res Function(MessageDomain) then) =
      _$MessageDomainCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String senderId,
      @JsonKey(ignore: true) bool isSender,
      String senderName,
      String senderAvatarUrl,
      String body,
      @TimestampConverter() Timestamp timestamp});
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
    Object isSender = freezed,
    Object senderName = freezed,
    Object senderAvatarUrl = freezed,
    Object body = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      senderId: senderId == freezed ? _value.senderId : senderId as String,
      isSender: isSender == freezed ? _value.isSender : isSender as bool,
      senderName:
          senderName == freezed ? _value.senderName : senderName as String,
      senderAvatarUrl: senderAvatarUrl == freezed
          ? _value.senderAvatarUrl
          : senderAvatarUrl as String,
      body: body == freezed ? _value.body : body as String,
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
      {@JsonKey(ignore: true) String id,
      String senderId,
      @JsonKey(ignore: true) bool isSender,
      String senderName,
      String senderAvatarUrl,
      String body,
      @TimestampConverter() Timestamp timestamp});
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
    Object isSender = freezed,
    Object senderName = freezed,
    Object senderAvatarUrl = freezed,
    Object body = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_MessageDomain(
      id: id == freezed ? _value.id : id as String,
      senderId: senderId == freezed ? _value.senderId : senderId as String,
      isSender: isSender == freezed ? _value.isSender : isSender as bool,
      senderName:
          senderName == freezed ? _value.senderName : senderName as String,
      senderAvatarUrl: senderAvatarUrl == freezed
          ? _value.senderAvatarUrl
          : senderAvatarUrl as String,
      body: body == freezed ? _value.body : body as String,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }
}

@JsonSerializable()
class _$_MessageDomain extends _MessageDomain {
  const _$_MessageDomain(
      {@JsonKey(ignore: true) this.id,
      @required this.senderId,
      @JsonKey(ignore: true) this.isSender,
      @required this.senderName,
      @required this.senderAvatarUrl,
      @required this.body,
      @TimestampConverter() this.timestamp})
      : assert(senderId != null),
        assert(senderName != null),
        assert(senderAvatarUrl != null),
        assert(body != null),
        super._();

  factory _$_MessageDomain.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageDomainFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String senderId;
  @override
  @JsonKey(ignore: true)
  final bool isSender;
  @override
  final String senderName;
  @override
  final String senderAvatarUrl;
  @override
  final String body;
  @override
  @TimestampConverter()
  final Timestamp timestamp;

  @override
  String toString() {
    return 'MessageDomain(id: $id, senderId: $senderId, isSender: $isSender, senderName: $senderName, senderAvatarUrl: $senderAvatarUrl, body: $body, timestamp: $timestamp)';
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
            (identical(other.isSender, isSender) ||
                const DeepCollectionEquality()
                    .equals(other.isSender, isSender)) &&
            (identical(other.senderName, senderName) ||
                const DeepCollectionEquality()
                    .equals(other.senderName, senderName)) &&
            (identical(other.senderAvatarUrl, senderAvatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.senderAvatarUrl, senderAvatarUrl)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(senderId) ^
      const DeepCollectionEquality().hash(isSender) ^
      const DeepCollectionEquality().hash(senderName) ^
      const DeepCollectionEquality().hash(senderAvatarUrl) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(timestamp);

  @override
  _$MessageDomainCopyWith<_MessageDomain> get copyWith =>
      __$MessageDomainCopyWithImpl<_MessageDomain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageDomainToJson(this);
  }
}

abstract class _MessageDomain extends MessageDomain {
  const _MessageDomain._() : super._();
  const factory _MessageDomain(
      {@JsonKey(ignore: true) String id,
      @required String senderId,
      @JsonKey(ignore: true) bool isSender,
      @required String senderName,
      @required String senderAvatarUrl,
      @required String body,
      @TimestampConverter() Timestamp timestamp}) = _$_MessageDomain;

  factory _MessageDomain.fromJson(Map<String, dynamic> json) =
      _$_MessageDomain.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get senderId;
  @override
  @JsonKey(ignore: true)
  bool get isSender;
  @override
  String get senderName;
  @override
  String get senderAvatarUrl;
  @override
  String get body;
  @override
  @TimestampConverter()
  Timestamp get timestamp;
  @override
  _$MessageDomainCopyWith<_MessageDomain> get copyWith;
}
