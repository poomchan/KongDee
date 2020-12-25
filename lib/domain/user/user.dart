import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertaladsod/infrastucture/core/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserDomain with _$UserDomain {
  const factory UserDomain({
    @required String id,
    @required String displayName,
    @required String email,
    @required String photoUrl,
    @required @JsonKey(defaultValue: {}) Map<String, bool> blockedStores,
    @required @TimestampConverter() Timestamp lastActive,
  }) = _User;

  factory UserDomain.fromFirestore(DocumentSnapshot snap) {
    final u = UserDomain.fromJson(snap.data());
    return u.copyWith(id: u.id);
  }

  factory UserDomain.fromFirebaseUser(User u) {
    return UserDomain(
      id: u.uid,
      displayName: u.displayName,
      email: u.email,
      photoUrl: u.photoURL,
      blockedStores: {},
      lastActive: Timestamp.now(),
    );
  }

  factory UserDomain.fromJson(Map<String, dynamic> json) =>
      _$UserDomainFromJson(json);
}
