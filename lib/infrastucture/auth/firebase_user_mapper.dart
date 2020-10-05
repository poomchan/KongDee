import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:fluttertaladsod/domain/core/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  UserDomain toDomain() {
    return UserDomain(
      id: UniqueId.fromUniqueString(uid),
      email: email,
      photoURL: photoURL,
      displayName: displayName,
    );
  }
}
