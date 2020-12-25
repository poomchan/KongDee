import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_failure.freezed.dart';

@immutable
@freezed
abstract class MessageFailure with _$MessageFailure {
  const factory MessageFailure.unexpected(dynamic detail) = _Unexpected;
  const factory MessageFailure.severFailure() = _SeverFailure;
  const factory MessageFailure.noSuchMessage() = _NoSuchMessage;
  const factory MessageFailure.emptyChatRoom() = _EmptyChatRoom;
}
