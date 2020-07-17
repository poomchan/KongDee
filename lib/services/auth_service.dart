import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertaladsod/storage/local_state_storage.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/services/db_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  loginSilently(BuildContext context) async {
    // Re-authenticate user silently when app is opened
    GoogleSignInAccount account = await _googleSignIn
        .signInSilently(suppressErrors: true)
        .catchError((err) {
      print('Error signing in silently: $err');
    });

    if (account != null) {
      print(account);
      // use did sign in silently
      createUserInFirestore(context);
    }
  }

  loginListener(BuildContext context) {
    // Detects when user signed in
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      if (account != null) {
        // use logged in
        createUserInFirestore(context);
      }
    }, onError: (err) {
      print('Error signing in: $err');
    });
  }

  loginWithGoogle() async {
    GoogleSignInAccount googleUser =
        await _googleSignIn.signIn().catchError((err) {
      print(err);
    });

    // return if sign in is unsuccessful
    if (googleUser == null) {
      return;
    }

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // get auth credential from GoogleAuth
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // create new userAuth to FirebaseAuth using the credential
    // this will update [onAuthStateChanged] stream
    _auth.signInWithCredential(credential);
  }

  logout(BuildContext context) {
    _googleSignIn.signOut();
    FirebaseAuth.instance.signOut();

    // if the user log out, clear the entire app state
    final netStorage = Provider.of<NetworkStateStorage>(context, listen: false);

    netStorage.updateIsAuth(false);
    Future.delayed(Duration(seconds: 2), () {
      netStorage.clear();
      Provider.of<LocalStateStorage>(context, listen: false).clear();
    });
  }

  createUserInFirestore(BuildContext context) async {
    final GoogleSignInAccount user = _googleSignIn.currentUser;
    DocumentReference _docRef = _db.collection('users').document(user.id);
    DocumentSnapshot doc = await _docRef.get();

    // if is new user, create user in Firestore
    if (!doc.exists) {
      _docRef.setData(
        {
          "id": user.id,
          "displayName": user.displayName,
          "email": user.email,
          "photoUrl": user.photoUrl,
          "bio": "",
          "timestamp": DateTime.now(),
          "last signin": DateTime.now(),
        },
      );
    } else {
      // come back user, update the last sign in time
      _docRef.updateData({
        "last signin": DateTime.now(),
      });
    }

    // get the current user data from Firestore
    dbService.fetchUserDataFromFirestore(context, user.id);
  }
}

final AuthService authService = AuthService();
