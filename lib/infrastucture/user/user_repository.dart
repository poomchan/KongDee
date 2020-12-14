import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertaladsod/domain/auth/user/user.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/auth/user/i_user_repository.dart';
import 'package:fluttertaladsod/domain/auth/user/user_failure.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/infrastucture/auth/user_dto.dart';
import 'package:fluttertaladsod/infrastucture/core/firestore_helper.dart';
import 'package:get/get.dart';

class UserRepository implements IUserRepository {
  FirebaseFirestore get _firestore => Get.find<FirebaseFirestore>();
  CollectionReference get _userRef => _firestore.userCollectionRef;
  @override
  Future<Either<UserFailure, UserDomain>> getUser(UniqueId uid) async {
    try {
      final userDoc = await _userRef.doc(uid.getOrCrash()).get();
      if (userDoc.exists) {
        return right(UserDto.fromFirestore(userDoc).toDomain());
      } else {
        return left(UserFailure.noSuchUser());
      }
    } catch (e) {
      return left(UserFailure.unexpected(e));
    }
  }

  @override
  Future<Either<UserFailure, Unit>> updateUser(UserDomain user) async {
    try {
      await _userRef
          .doc(user.id.getOrCrash())
          .update(UserDto.fromDomain(user).toJson());
      return right(unit);
    } catch (e) {
      return left(UserFailure.unexpected(e));
    }
  }
}
