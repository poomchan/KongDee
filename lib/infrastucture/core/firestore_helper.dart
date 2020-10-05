import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/application/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/core/error.dart';
import 'package:fluttertaladsod/injection.dart';

extension FirestoreX on FirebaseFirestore {
  CollectionReference get userCollectionRef =>
      getIt<FirebaseFirestore>().collection('users');

  CollectionReference get storeCollectionRef =>
      getIt<FirebaseFirestore>().collection('stores');

  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final UserDomain user =
        userOption.fold(() => throw 'user unauthenticated', (user) => user);
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getOrCrash());
  }

  Future<UserDomain> userDomain() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final UserDomain user =
        userOption.fold(() => throw 'user unauthenticated', (user) => user);
    return user;
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get storeCollection => collection('stores');
  CollectionReference get userCollection => collection('users');
}
