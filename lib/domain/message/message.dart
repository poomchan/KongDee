import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_generators.dart';
import 'package:fluttertaladsod/domain/message/validators.dart';
import 'package:fluttertaladsod/infrastucture/core/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@immutable
@freezed
abstract class MessageDomain implements _$MessageDomain {
  const factory MessageDomain({
    @JsonKey(ignore: true) String id,
    @required String senderId,
    @JsonKey(ignore: true) bool isSender,
    @required String senderName,
    @required String senderAvatarUrl,
    @required String body,
    @TimestampConverter() Timestamp timestamp,
  }) = _MessageDomain;

  factory MessageDomain.created() => MessageDomain(
        id: UniqueId().toString(),
        senderId: '',
        senderName: '',
        senderAvatarUrl: '',
        body: '',
        isSender: true,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return validateMessageBody(body).fold(
      (f) => some(f),
      (ok) => none(),
    );
  }

  bool get isValid => failureOption.isNone();

  factory MessageDomain.fromFirestore(
    DocumentSnapshot snap, {
    @required String viewerId,
  }) {
    final m = MessageDomain.fromJson(snap.data());
    return m.copyWith(
      id: snap.id,
      isSender: viewerId == m.senderId,
    );
  }

  factory MessageDomain.fromJson(Map<String, dynamic> json) =>
      _$MessageDomainFromJson(json);

  const MessageDomain._();
}
