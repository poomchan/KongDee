// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:fluttertaladsod/infrastucture/core/json_converters.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@immutable
@freezed
abstract class UserDto implements _$UserDto {
  const factory UserDto({
    @required String id,
    @required String displayName,
    @required String email,
    @required String photoUrl,
    @required Map<String, bool> blockedStores,
    @required @TimestampConverter() Timestamp lastActive,
  }) = _UserDto;

  factory UserDto.fromDomain(UserDomain u) => UserDto(
        id: u.id.getOrCrash(),
        displayName: u.displayName,
        email: u.email,
        photoUrl: u.photoUrl,
        blockedStores: u.blockedStores,
        lastActive: Timestamp.now(),
      );
  factory UserDto.fromNewUser(User u) => UserDto(
        id: u.uid,
        displayName: u.displayName,
        email: u.email,
        photoUrl: u.photoURL,
        blockedStores: const {},
        lastActive: Timestamp.now(),
      );
  UserDomain toDomain() => UserDomain(
        id: UniqueId.fromUniqueString(id),
        displayName: displayName,
        email: email,
        photoUrl: photoUrl,
        blockedStores: blockedStores,
        lastActive: lastActive,
      );
      
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromFirestore(DocumentSnapshot doc) =>
      UserDto.fromJson(doc.data());

  const UserDto._();
}
