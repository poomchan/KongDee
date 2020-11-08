import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertaladsod/application/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:fluttertaladsod/infrastucture/auth/firebase_user_mapper.dart';

@prod
@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthFacade(this._googleSignIn, this._firebaseAuth);

  @override
  Future<Option<UserDomain>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    // cancle by user
    if (googleUser == null) return;
    final authentication = await googleUser.authentication;
    final authCredential = GoogleAuthProvider.getCredential(
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
  Stream<Option<UserDomain>> watchSignedInUser() async* {
    final userStream = _firebaseAuth.authStateChanges();
    yield* userStream.map((User user) {
      return optionOf(
        user == null
            ? null
            : UserDomain(
                displayName: user.displayName,
                email: user.email,
                id: UniqueId.fromUniqueString(user.uid),
                photoURL: user.photoURL,
              ),
      );
    });
  }

  UserDomain get user => getIt<AuthWatcherState>().maybeMap(
      authenticated: (state) => state.user,
      orElse: throw 'unauthenticated user');

  @override
  bool isAuthenticated() {
    return _firebaseAuth.currentUser != null;
  }
}
