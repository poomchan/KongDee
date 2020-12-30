// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/core/value_validators.dart';

class MessageBody extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  static const int maxLength = 500;

  factory MessageBody(String value) {
    return MessageBody._(
        validateInputNotNull(value).flatMap(validateStringNotEmpty));
  }

  factory MessageBody.empty() => MessageBody('');

  const MessageBody._(this.value);
}

class SenderAvatarUrl extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory SenderAvatarUrl(String value) {
    return SenderAvatarUrl._(validateInputNotNull(value));
  }

  const SenderAvatarUrl._(this.value);
}

class SenderName extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory SenderName(String value) {
    return SenderName._(validateInputNotNull(value));
  }

  const SenderName._(this.value);
}
