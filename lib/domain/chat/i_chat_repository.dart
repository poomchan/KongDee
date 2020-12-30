// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'chat_failure.dart';
import 'message.dart';

abstract class IChatRepository {
  Stream<Either<ChatFailure, List<MessageDomain>>> watchStoreMessages({
    @required UniqueId storeId,
    @required UniqueId viewerId,
    @required int amount,
  });
  Future<Either<ChatFailure, List<MessageDomain>>> fetchMoreStoreMessages({
    @required UniqueId storeId,
    @required UniqueId viewerId,
    @required MessageDomain lastMessage,
  });
  Future<Either<ChatFailure, Unit>> uploadStoreMessage({
    @required UniqueId storeId,
    @required MessageDomain message,
  });
  Future<Either<ChatFailure, Unit>> deleteStoreMessage({
    @required UniqueId storeId,
    @required UniqueId messageId,
  });
}
