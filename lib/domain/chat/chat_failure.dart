import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_failure.freezed.dart';

@immutable
@freezed
abstract class ChatFailure with _$ChatFailure {
  const factory ChatFailure.unexpected(dynamic err) = _Unexpected;
  const factory ChatFailure.severFailure() = _SeverFailure;
  const factory ChatFailure.noSuchMessage() = _NoSuchMessage;
  const factory ChatFailure.emptyChatRoom() = _EmptyChatRoom;
}
