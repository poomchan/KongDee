import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  Future<void> signInWithGoogle();
  Stream<Either<AuthFailure, UserDomain>> watchSignedInUser();
  Future<Either<AuthFailure, UserDomain>> getSignedInUser();
  bool isAuthenticated();
  Future<void> signOut();
}
