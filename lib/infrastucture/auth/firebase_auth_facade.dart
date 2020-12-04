import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertaladsod/domain/auth/auth_failure.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertaladsod/infrastucture/auth/firebase_user_mapper.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final _googleSignIn = Get.find<GoogleSignIn>();
  final FirebaseAuth _firebaseAuth = Get.find<FirebaseAuth>();

  @override
  Future<Either<AuthFailure, UserDomain>> getSignedInUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        return right(user.toDomain());
      } else {
        return left(AuthFailure.unauthenticated());
      }
    } catch (e) {
      return left(AuthFailure.serverError());
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    // cancle by user
    if (googleUser == null) return;
    final authentication = await googleUser.authentication;
    final authCredential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    return _firebaseAuth.signInWithCredential(authCredential);
  }

  @override
  Future<void> signOut() {
    return Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }

  @override
  Stream<Either<AuthFailure, UserDomain>> watchSignedInUser() async* {
    try {
      final userStream = _firebaseAuth.authStateChanges();
      yield* userStream.map((User user) {
        if (user == null) {
          return left(AuthFailure.unauthenticated());
        } else {
          // can create user in database and update the latest active status here
          return right(user.toDomain());
        }
      });
    } catch (e) {
      yield left(AuthFailure.serverError());
    }
  }

  @override
  bool isAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }
}
