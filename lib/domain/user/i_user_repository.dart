// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:fluttertaladsod/domain/user/user_failure.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, Unit>> updateUser(UserDomain user);
  Future<Either<UserFailure, UserDomain>> getUser(UniqueId uid);
}
