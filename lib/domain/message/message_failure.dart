import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_failure.freezed.dart';

@immutable
@freezed
abstract class MessageFailure with _$MessageFailure {
  const factory MessageFailure.unexpected() = _Unexpected;
  const factory MessageFailure.severFailure() = _SeverFailure;
  const factory MessageFailure.emtyChat() = _EmptyChat;
}
