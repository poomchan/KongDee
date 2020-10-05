import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/value_objects.dart';
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

  MessageDomain toDomain() => MessageDomain(
        id: UniqueId.fromUniqueString(id),
        senderId: UniqueId.fromUniqueString(senderId),
        senderName: SenderName(senderName),
        senderAvatarUrl: SenderAvatarUrl(senderAvatarUrl),
        body: MessageBody(body),
        isSender: false,
        timestamp: timestamp,
      );

  const MessageDto._();
}

class MyTimestamp {
  FieldValue serverTimestamp;
  Timestamp timestamp;

  MyTimestamp._({this.serverTimestamp, this.timestamp});

  factory MyTimestamp.serverTimestamp() {
    return MyTimestamp._(serverTimestamp: FieldValue.serverTimestamp());
  }

  factory MyTimestamp.timestamp(Timestamp timestamp) {
    assert(timestamp != null);
    return MyTimestamp._(timestamp: timestamp);
  }
}

class MyTimestampConverter implements JsonConverter<MyTimestamp, Object> {
  const MyTimestampConverter();

  @override
  MyTimestamp fromJson(Object json) {
    return MyTimestamp.timestamp(json as Timestamp);
  }

  @override
  Object toJson(MyTimestamp myTimestamp) => myTimestamp.serverTimestamp;
}
