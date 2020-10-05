import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';

import 'message.dart';

abstract class IMessageRepository {
  Stream<Either<MessageFailure, List<MessageDomain>>> watchMessages({
    @required UniqueId storeId,
  });
  Stream<Either<MessageFailure, List<MessageDomain>>> watchMoreMessages({
    @required UniqueId storeId,
  });
  Future<Either<MessageFailure, Unit>> uploadMessage({
    @required UniqueId storeId,
    @required MessageDomain chat,
  });
  Future<Either<MessageFailure, Unit>> deleteMessage({
    @required UniqueId storeId,
    @required UniqueId chatId,
  });
}
