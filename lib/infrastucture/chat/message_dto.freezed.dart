// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) {
  return _MessageDto.fromJson(json);
}

class _$MessageDtoTearOff {
  const _$MessageDtoTearOff();

// ignore: unused_element
  _MessageDto call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) bool isSender,
      @required @nullable String senderId,
      @required @nullable String senderAvatarUrl,
      @required @nullable String senderName,
      @required @nullable String body,
      @required @TimestampConverter() Timestamp timestamp}) {
    return _MessageDto(
      id: id,
      isSender: isSender,
      senderId: senderId,
      senderAvatarUrl: senderAvatarUrl,
      senderName: senderName,
      body: body,
      timestamp: timestamp,
    );
  }
}

// ignore: unused_element
const $MessageDto = _$MessageDtoTearOff();

mixin _$MessageDto {
  @JsonKey(ignore: true)
  String get id;
  @JsonKey(ignore: true)
  bool get isSender;
  @nullable
  String get senderId;
  @nullable
  String get senderAvatarUrl;
  @nullable
  String get senderName;
  @nullable
  String get body;
  @TimestampConverter()
  Timestamp get timestamp;

  Map<String, dynamic> toJson();
  $MessageDtoCopyWith<MessageDto> get copyWith;
}

abstract class $MessageDtoCopyWith<$Res> {
  factory $MessageDtoCopyWith(
          MessageDto value, $Res Function(MessageDto) then) =
      _$MessageDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) bool isSender,
      @nullable String senderId,
      @nullable String senderAvatarUrl,
      @nullable String senderName,
      @nullable String body,
      @TimestampConverter() Timestamp timestamp});
}

class _$MessageDtoCopyWithImpl<$Res> implements $MessageDtoCopyWith<$Res> {
  _$MessageDtoCopyWithImpl(this._value, this._then);

  final MessageDto _value;
  // ignore: unused_field
  final $Res Function(MessageDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object isSender = freezed,
    Object senderId = freezed,
    Object senderAvatarUrl = freezed,
    Object senderName = freezed,
    Object body = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      isSender: isSender == freezed ? _value.isSender : isSender as bool,
      senderId: senderId == freezed ? _value.senderId : senderId as String,
      senderAvatarUrl: senderAvatarUrl == freezed
          ? _value.senderAvatarUrl
          : senderAvatarUrl as String,
      senderName:
          senderName == freezed ? _value.senderName : senderName as String,
      body: body == freezed ? _value.body : body as String,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }
}

abstract class _$MessageDtoCopyWith<$Res> implements $MessageDtoCopyWith<$Res> {
  factory _$MessageDtoCopyWith(
          _MessageDto value, $Res Function(_MessageDto) then) =
      __$MessageDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) bool isSender,
      @nullable String senderId,
      @nullable String senderAvatarUrl,
      @nullable String senderName,
      @nullable String body,
      @TimestampConverter() Timestamp timestamp});
}

class __$MessageDtoCopyWithImpl<$Res> extends _$MessageDtoCopyWithImpl<$Res>
    implements _$MessageDtoCopyWith<$Res> {
  __$MessageDtoCopyWithImpl(
      _MessageDto _value, $Res Function(_MessageDto) _then)
      : super(_value, (v) => _then(v as _MessageDto));

  @override
  _MessageDto get _value => super._value as _MessageDto;

  @override
  $Res call({
    Object id = freezed,
    Object isSender = freezed,
    Object senderId = freezed,
    Object senderAvatarUrl = freezed,
    Object senderName = freezed,
    Object body = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_MessageDto(
      id: id == freezed ? _value.id : id as String,
      isSender: isSender == freezed ? _value.isSender : isSender as bool,
      senderId: senderId == freezed ? _value.senderId : senderId as String,
      senderAvatarUrl: senderAvatarUrl == freezed
          ? _value.senderAvatarUrl
          : senderAvatarUrl as String,
      senderName:
          senderName == freezed ? _value.senderName : senderName as String,
      body: body == freezed ? _value.body : body as String,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }
}

@JsonSerializable()
class _$_MessageDto extends _MessageDto with DiagnosticableTreeMixin {
  const _$_MessageDto(
      {@JsonKey(ignore: true) this.id,
      @JsonKey(ignore: true) this.isSender,
      @required @nullable this.senderId,
      @required @nullable this.senderAvatarUrl,
      @required @nullable this.senderName,
      @required @nullable this.body,
      @required @TimestampConverter() this.timestamp})
      : assert(timestamp != null),
        super._();

  factory _$_MessageDto.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  @JsonKey(ignore: true)
  final bool isSender;
  @override
  @nullable
  final String senderId;
  @override
  @nullable
  final String senderAvatarUrl;
  @override
  @nullable
  final String senderName;
  @override
  @nullable
  final String body;
  @override
  @TimestampConverter()
  final Timestamp timestamp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageDto(id: $id, isSender: $isSender, senderId: $senderId, senderAvatarUrl: $senderAvatarUrl, senderName: $senderName, body: $body, timestamp: $timestamp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isSender', isSender))
      ..add(DiagnosticsProperty('senderId', senderId))
      ..add(DiagnosticsProperty('senderAvatarUrl', senderAvatarUrl))
      ..add(DiagnosticsProperty('senderName', senderName))
      ..add(DiagnosticsProperty('body', body))
      ..add(DiagnosticsProperty('timestamp', timestamp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessageDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isSender, isSender) ||
                const DeepCollectionEquality()
                    .equals(other.isSender, isSender)) &&
            (identical(other.senderId, senderId) ||
                const DeepCollectionEquality()
                    .equals(other.senderId, senderId)) &&
            (identical(other.senderAvatarUrl, senderAvatarUrl) ||
                const DeepCollectionEquality()
                    .equals(other.senderAvatarUrl, senderAvatarUrl)) &&
            (identical(other.senderName, senderName) ||
                const DeepCollectionEquality()
                    .equals(other.senderName, senderName)) &&
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
      const DeepCollectionEquality().hash(isSender) ^
      const DeepCollectionEquality().hash(senderId) ^
      const DeepCollectionEquality().hash(senderAvatarUrl) ^
      const DeepCollectionEquality().hash(senderName) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(timestamp);

  @override
  _$MessageDtoCopyWith<_MessageDto> get copyWith =>
      __$MessageDtoCopyWithImpl<_MessageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageDtoToJson(this);
  }
}

abstract class _MessageDto extends MessageDto {
  const _MessageDto._() : super._();
  const factory _MessageDto(
      {@JsonKey(ignore: true) String id,
      @JsonKey(ignore: true) bool isSender,
      @required @nullable String senderId,
      @required @nullable String senderAvatarUrl,
      @required @nullable String senderName,
      @required @nullable String body,
      @required @TimestampConverter() Timestamp timestamp}) = _$_MessageDto;

  factory _MessageDto.fromJson(Map<String, dynamic> json) =
      _$_MessageDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  @JsonKey(ignore: true)
  bool get isSender;
  @override
  @nullable
  String get senderId;
  @override
  @nullable
  String get senderAvatarUrl;
  @override
  @nullable
  String get senderName;
  @override
  @nullable
  String get body;
  @override
  @TimestampConverter()
  Timestamp get timestamp;
  @override
  _$MessageDtoCopyWith<_MessageDto> get copyWith;
}
