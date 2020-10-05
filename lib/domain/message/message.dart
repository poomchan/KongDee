import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
        id: UniqueId(),
        senderId: UniqueId(),
        senderName: SenderName(''),
        senderAvatarUrl: SenderAvatarUrl(''),
        body: MessageBody(''),
        isSender: true,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return body.failureOrUnit
        .fold((f) => some(f), (r) => none());
  }

  const MessageDomain._();
}
