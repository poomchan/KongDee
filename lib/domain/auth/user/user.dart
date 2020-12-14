import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../user.freezed.dart';

@freezed
abstract class UserDomain with _$UserDomain {
  const factory UserDomain({
    @required UniqueId id,
    @required String displayName,
    @required String email,
    @required String photoUrl,
    @required Map<String, bool> blockedStores,
    @required Timestamp lastActive,
  }) = _User;
}
