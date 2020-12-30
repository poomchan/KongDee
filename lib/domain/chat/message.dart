// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:fluttertaladsod/domain/chat/value_objects.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/user/user.dart';

part 'message.freezed.dart';

@immutable
@freezed
abstract class MessageDomain implements _$MessageDomain {
  const factory MessageDomain({
    @required UniqueId id,
    @required UniqueId senderId,
    @required SenderName senderName,
    @required SenderAvatarUrl senderAvatarUrl,
    @required MessageBody body,
    @required bool isSender,
    Timestamp timestamp,
  }) = _MessageDomain;

  factory MessageDomain.empty() => MessageDomain(
        id: UniqueId.empty(),
        senderId: UniqueId.empty(),
        senderName: SenderName(''),
        senderAvatarUrl: SenderAvatarUrl(''),
        body: MessageBody.empty(),
        isSender: true,
      );

  factory MessageDomain.created({
    @required UserDomain user,
    @required String body,
  }) =>
      MessageDomain(
        id: UniqueId.generated(),
        senderId: user.id,
        senderName: SenderName(user.displayName),
        senderAvatarUrl: SenderAvatarUrl(user.photoUrl),
        body: MessageBody(body),
        isSender: true,
      );

  Option<ValueFailure> get failureOption {
    return body.failureOrUnit
        .andThen(senderId.failureOrUnit)
        .andThen(senderName.failureOrUnit)
        .andThen(senderAvatarUrl.failureOrUnit)
        .andThen(this.id.failureOrUnit)
        .fold(
          (f) => some(f),
          (unit) => none(),
        );
  }

  bool get isValid => failureOption.isNone();

  const MessageDomain._();
}
