import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertaladsod/domain/auth/auth_failure.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:fluttertaladsod/infrastucture/auth/user_dto.dart';
import 'package:fluttertaladsod/infrastucture/core/firestore_helper.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final GoogleSignIn _googleSignIn = Get.find();
  final FirebaseAuth _firebaseAuth = Get.find();
  final FirebaseFirestore _firestore = Get.find();

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return left(AuthFailure.cancleByUser());
      final authentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken);

      await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } catch (err) {
      return left(AuthFailure.unexpected(err));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    return Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }

  @override
  bool isAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }

  @override
  Future<Either<AuthFailure, UserDomain>> getSignedInUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      final userRef = _firestore.userCollectionRef;
      final userDoc = await userRef.doc(user.uid).get();
      if (user != null) {
        return right(UserDto.fromFirestore(userDoc).toDomain());
      } else {
        return left(AuthFailure.unauthenticated());
      }
    } catch (e) {
      return left(AuthFailure.serverError());
    }
  }

  @override
  Stream<Either<AuthFailure, UserDomain>> watchSignedInUser() async* {
    try {
      final userStream = _firebaseAuth.authStateChanges();
      yield* userStream.asyncMap((User user) async {
        if (user == null) {
          return left(AuthFailure.unauthenticated());
        } else {
          final fOrUser = await _putAndGetUserInDatabase(user);
          return fOrUser.fold(
            (f) => left(f),
            (user) => right(user),
          );
        }
      });
    } catch (e) {
      print(e);
      yield left(AuthFailure.serverError());
    }
  }

  Future<Either<AuthFailure, UserDomain>> _putAndGetUserInDatabase(
      User user) async {
    final userRef = _firestore.userCollectionRef;
    DocumentSnapshot userDoc =
        await userRef.doc(user.uid).get(GetOptions(source: Source.server));
    try {
      if (userDoc.exists) {
        await userRef
            .doc(user.uid)
            .update(UserDto.fromFirestore(userDoc).toJson());
      } else {
        await userRef.doc(user.uid).set(UserDto.fromNewUser(user).toJson());
      }
      userDoc = await userRef.doc(user.uid).get();
      return right(UserDto.fromFirestore(userDoc).toDomain());
    } catch (err) {
      print(err);
      return left(AuthFailure.unexpected(err));
    }
  }
}
