import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/infrastucture/store/store_dto.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertaladsod/infrastucture/core/firestore_helper.dart';

class StoreRepository implements IStoreRepository {
  final _firestore = Get.find<FirebaseFirestore>();
  final _storage = Get.find<StorageReference>();
  final _geo = Get.find<Geoflutterfire>();

  @override
  Stream<Either<StoreFailure, List<Store>>> watchNearbyStore({
    @required LocationDomain location,
    @required BehaviorSubject<double> rad,
    @required Option<UserDomain> userOption,
  }) async* {
    assert(location != null);
    assert(rad != null);
    assert(userOption != null);

    yield* rad.switchMap((rad) {
      return _geo
          .collection(collectionRef: _firestore.storeCollectionRef)
          .within(
            center: location.geoFirePoint,
            radius: rad,
            field: 'location.geoFirePoint',
            strictMode: true,
          );
    }).map(
      (snapshots) {
        if (snapshots.isEmpty) {
          return left<StoreFailure, List<Store>>(StoreFailure.noStore());
        }
        return right<StoreFailure, List<Store>>(
          snapshots
              .map(
                (snap) => StoreDto.fromFirestore(snap: snap)
                    .toDomain(location, userOption),
              )
              .toList(),
        );
      },
    ).onErrorReturnWith(
      (err) {
        // log error onto the console here
        return left<StoreFailure, List<Store>>(StoreFailure.unexpected(err));
      },
    ).timeout(Duration(seconds: 5), onTimeout: _onTimeout);
  }

  void _onTimeout(event) {
    event.add(left(StoreFailure.timeout()));
  }

  @override
  Stream<Either<StoreFailure, Store>> watchSingleStore({
    @required UniqueId storeId,
    @required LocationDomain location,
    @required Option<UserDomain> userOption,
  }) async* {
    yield* _firestore.storeCollectionRef
        .doc(storeId.getOrCrash())
        .snapshots()
        .map((snap) {
      if (!snap.exists) {
        return left<StoreFailure, Store>(StoreFailure.noStore());
      } else {
        return right<StoreFailure, Store>(
            StoreDto.fromFirestore(snap: snap).toDomain(location, userOption));
      }
    }).onErrorReturnWith((err) {
      // print error onto the console here
      return left<StoreFailure, Store>(StoreFailure.unexpected(err));
    });
  }

  @override
  Stream<Either<StoreFailure, Store>> watchOwnedStore({
    @required UniqueId ownerId,
    @required LocationDomain location,
    @required UserDomain user,
  }) async* {
    yield* _firestore.storeCollectionRef
        .where('ownerId', isEqualTo: ownerId.getOrCrash())
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return left<StoreFailure, Store>(StoreFailure.noStore());
      } else {
        return right<StoreFailure, Store>(snapshot.docs
            .map(
              (doc) => StoreDto.fromFirestore(snap: doc)
                  .toDomain(location, some(user)),
            )
            .toList()
            .first);
      }
    }).onErrorReturnWith((err) {
      // log error onto the console here
      return left<StoreFailure, Store>(StoreFailure.unexpected(err));
    });
  }

  @override
  Future<Either<StoreFailure, Unit>> create(Store store) async {
    final jsonData = StoreDto.fromDomain(store).toJson();
    try {
      _firestore.storeCollectionRef.doc(UniqueId().getOrCrash()).set(jsonData);
    } catch (err) {
      return left(StoreFailure.unexpected(err));
    }
    return right(unit);
  }

  @override
  Future<Either<StoreFailure, Unit>> update(Store store) async {
    final jsonData = StoreDto.fromDomain(store).toJson();

    try {
      _firestore.storeCollectionRef.doc(store.id.getOrCrash()).update(jsonData);
    } catch (err) {
      return left(StoreFailure.unexpected(err));
    }
    return right(unit);
  }

  @override
  Future<Either<StoreFailure, Unit>> delete(UniqueId storeId) async {
    try {
      await _firestore.storeCollectionRef.doc(storeId.getOrCrash()).delete();
      return right(unit);
    } catch (err) {
      return left(StoreFailure.unexpected(err));
    }
  }

  @override
  Future<Either<StoreFailure, String>> uploadFileImage(
      File img, String path) async {
    final imageId = Uuid().v4();
    try {
      // upload (path in firebase storage)
      final StorageUploadTask uploadTask =
          _storage.child("$path/img_$imageId").putFile(img);

      // wait for completion
      final StorageTaskSnapshot storageSnap = await uploadTask.onComplete;

      //get download Url
      final String mediaUrl = await storageSnap.ref.getDownloadURL() as String;
      return right(mediaUrl);
    } catch (err) {
      // log error here
      return left(StoreFailure.unexpected(err));
    }
  }
}
