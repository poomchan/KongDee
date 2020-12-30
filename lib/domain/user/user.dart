// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_objects.dart';

part 'user.freezed.dart';

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
