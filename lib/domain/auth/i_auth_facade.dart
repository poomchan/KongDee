import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';

abstract class IAuthFacade {
  Future<void> signInWithGoogle();
  Stream<Option<UserDomain>> watchSignedInUser();
  Future<Option<UserDomain>> getSignedInUser();
  Future<void> signOut();
}
