import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/chat/message.dart';
import 'package:fluttertaladsod/domain/chat/value_objects.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:fluttertaladsod/infrastucture/core/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@immutable
@freezed
abstract class MessageDto implements _$MessageDto {
  const factory MessageDto({
    @JsonKey(ignore: true) String id,
    @JsonKey(ignore: true) bool isSender,
    @required @nullable String senderId,
    @required @nullable String senderAvatarUrl,
    @required @nullable String senderName,
    @required @nullable String body,
    @required @TimestampConverter() Timestamp timestamp,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  factory MessageDto.fromFirestore(DocumentSnapshot doc) {
    return MessageDto.fromJson(doc.data()).copyWith(id: doc.id);
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
