import 'package:dartz/dartz.dart';

import 'package:fluttertaladsod/domain/auth/user/user.dart';
import 'package:fluttertaladsod/domain/auth/user/user_failure.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, Unit>> updateUser(UserDomain user);
  Future<Either<UserFailure, UserDomain>> getUser(UniqueId uid);
}