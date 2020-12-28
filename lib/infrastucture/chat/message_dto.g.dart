// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageDto _$_$_MessageDtoFromJson(Map<String, dynamic> json) {
  return _$_MessageDto(
    senderId: json['senderId'] as String,
    senderAvatarUrl: json['senderAvatarUrl'] as String,
    senderName: json['senderName'] as String,
    body: json['body'] as String,
    timestamp: const TimestampConverter().fromJson(json['timestamp']),
  );
}

Map<String, dynamic> _$_$_MessageDtoToJson(_$_MessageDto instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'senderAvatarUrl': instance.senderAvatarUrl,
      'senderName': instance.senderName,
      'body': instance.body,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };
