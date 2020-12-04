import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:get/get.dart';

extension FirestoreX on FirebaseFirestore {
  CollectionReference get userCollectionRef =>
      Get.find<FirebaseFirestore>().collection('users');

  CollectionReference get storeCollectionRef =>
      Get.find<FirebaseFirestore>().collection('stores');

  Future<DocumentReference> userDocument() async {
    final userOption = await Get.find<IAuthFacade>().getSignedInUser();
    final UserDomain user =
        userOption.fold((f) => throw 'user unauthenticated', (user) => user);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getOrCrash());
  }

  Future<UserDomain> userDomain() async {
    final userOption = await Get.find<IAuthFacade>().getSignedInUser();
    final UserDomain user =
        userOption.fold((f) => throw 'user unauthenticated', (user) => user);
    return user;
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get storeCollection => collection('stores');
  CollectionReference get userCollection => collection('users');
}
