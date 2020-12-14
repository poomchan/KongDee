import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/auth/user/user.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  /// return true if auth success, false if not
  Future<bool> signInWithGoogle();
  Future<void> signInWithApple();
  Future<void> signInWithFacebook();
  Stream<Either<AuthFailure, UserDomain>> watchSignedInUser();
  Future<Either<AuthFailure, UserDomain>> getSignedInUser();
  bool isAuthenticated();
  Future<void> signOut();
}
