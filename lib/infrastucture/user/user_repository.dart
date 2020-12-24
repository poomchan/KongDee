import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/user/i_user_repository.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:fluttertaladsod/domain/user/user_failure.dart';
import 'package:fluttertaladsod/infrastucture/core/firestore_helper.dart';
import 'package:get/get.dart';

class UserRepository implements IUserRepository {
  FirebaseFirestore get _firestore => Get.find<FirebaseFirestore>();
  CollectionReference get _userRef => _firestore.userCollectionRef;
  @override
  Future<Either<UserFailure, UserDomain>> getUser(String uid) async {
    try {
      final userDoc = await _userRef.doc(uid).get();
      if (userDoc.exists) {
        return right(UserDomain.fromFirestore(userDoc));
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
      await _userRef.doc(user.id).update(user.toJson());
      return right(unit);
    } catch (e) {
      return left(UserFailure.unexpected(e));
    }
  }
}
