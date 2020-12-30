// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:fluttertaladsod/domain/user/user.dart';
import 'auth_failure.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<Either<AuthFailure, Unit>> signInWithApple();
  Future<Either<AuthFailure, Unit>> signInWithFacebook();
  Stream<Either<AuthFailure, UserDomain>> watchSignedInUser();
  Future<Either<AuthFailure, UserDomain>> getSignedInUser();
  bool isAuthenticated();
  Future<void> signOut();
}
