import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/chat/message.dart';
import 'package:fluttertaladsod/domain/chat/value_objects.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/infrastucture/core/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@immutable
@freezed
abstract class MessageDto implements _$MessageDto {
  const factory MessageDto({
    @required String id,
    @required String senderId,
    @required String senderAvatarUrl,
    @required String senderName,
    @required String body,
    @JsonKey(ignore: true) bool isSender,
    @required @TimestampConverter() Timestamp timestamp,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  factory MessageDto.fromFirestore(DocumentSnapshot doc) {
    return MessageDto.fromJson(doc.data());
  }

  factory MessageDto.fromDomain(MessageDomain m) {
    return MessageDto(
      id: m.id.getOrCrash(),
      senderId: m.senderId.getOrCrash(),
      senderAvatarUrl: m.senderAvatarUrl.getOrCrash(),
      senderName: m.senderName.getOrCrash(),
      body: m.body.getOrCrash(),
      timestamp: Timestamp.now(),
    );
  }

  // add aditional message properties besides json here
  MessageDomain toDomain({
    @required UniqueId viewerId,
  }) =>
      MessageDomain(
        id: UniqueId.fromUniqueString(id),
        senderId: UniqueId.fromUniqueString(senderId),
        senderName: SenderName(senderName),
        senderAvatarUrl: SenderAvatarUrl(senderAvatarUrl),
        body: MessageBody(body),
        isSender: senderId == viewerId.getOrCrash(),
        timestamp: timestamp,
      );

  const MessageDto._();
}
