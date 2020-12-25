// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageDomain _$_$_MessageDomainFromJson(Map<String, dynamic> json) {
  return _$_MessageDomain(
    senderId: json['senderId'] as String,
    senderName: json['senderName'] as String,
    senderAvatarUrl: json['senderAvatarUrl'] as String,
    body: json['body'] as String,
    timestamp: const TimestampConverter().fromJson(json['timestamp']),
  );
}

Map<String, dynamic> _$_$_MessageDomainToJson(_$_MessageDomain instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderAvatarUrl': instance.senderAvatarUrl,
      'body': instance.body,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };
