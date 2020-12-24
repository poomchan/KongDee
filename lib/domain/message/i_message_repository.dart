import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';

import 'message.dart';

abstract class IMessageRepository {
  IMessageRepository();
  static const int itemPerPage = 20;

  Stream<Either<MessageFailure, List<MessageDomain>>> watchMessages({
    @required String storeId,
    @required String viewerId, // to see that isSender or not
  });
  Future<Either<MessageFailure, List<MessageDomain>>> fetchMoreMessages({
    @required String storeId,
    @required String viewerId, // to see that isSender or not
  });
  Future<Either<MessageFailure, Unit>> uploadMessage({
    @required String storeId,
    @required MessageDomain chat,
  });
  Future<Either<MessageFailure, Unit>> deleteMessage({
    @required String storeId,
    @required String chatId,
  });

  void clearState();
}
