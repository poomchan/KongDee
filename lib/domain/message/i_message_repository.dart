import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';

import 'message.dart';

abstract class IMessageRepository {
  IMessageRepository();
  static const int itemPerPage = 20;

  Stream<Either<MessageFailure, List<MessageDomain>>> watchMessages({
    @required UniqueId storeId,
    @required UniqueId viewerId, // to see that isSender or not
  });
  Future<Either<MessageFailure, List<MessageDomain>>> fetchMoreMessages({
    @required UniqueId storeId,
    @required UniqueId viewerId, // to see that isSender or not
  });
  Future<Either<MessageFailure, Unit>> uploadMessage({
    @required UniqueId storeId,
    @required MessageDomain chat,
  });
  Future<Either<MessageFailure, Unit>> deleteMessage({
    @required UniqueId storeId,
    @required UniqueId chatId,
  });

  void clearState();
}
