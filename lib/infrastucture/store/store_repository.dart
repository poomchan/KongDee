import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:fluttertaladsod/infrastucture/core/firestore_helper.dart';

class StoreRepository implements IStoreRepository {
  final _firestore = Get.find<FirebaseFirestore>();
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
              .map((snap) => Store.fromFirestore(
                    snap,
                    l: location,
                    userOption: userOption,
                  ))
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
    @required String storeId,
    @required LocationDomain location,
    @required Option<UserDomain> userOption,
  }) async* {
    yield* _firestore.storeCollectionRef.doc(storeId).snapshots().map((snap) {
      if (!snap.exists) {
        return left<StoreFailure, Store>(StoreFailure.noStore());
      } else {
        return right<StoreFailure, Store>(Store.fromFirestore(
          snap,
          userOption: userOption,
          l: location,
        ));
      }
    }).onErrorReturnWith((err) {
      // print error onto the console here
      return left<StoreFailure, Store>(StoreFailure.unexpected(err));
    });
  }

  @override
  Stream<Either<StoreFailure, Store>> watchOwnedStore({
    @required String ownerId,
    @required LocationDomain location,
    @required UserDomain user,
  }) async* {
    yield* _firestore.storeCollectionRef
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return left<StoreFailure, Store>(StoreFailure.noStore());
      } else {
        return right<StoreFailure, Store>(snapshot.docs
            .map(
              (doc) => Store.fromFirestore(
                doc,
                l: location,
                userOption: some(user),
              ),
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
    try {
      final jsonData = store.toJson();
      _firestore.storeCollectionRef.doc(store.id).set(jsonData);
    } catch (err) {
      return left(StoreFailure.unexpected(err));
    }
    return right(unit);
  }

  @override
  Future<Either<StoreFailure, Unit>> update(Store store) async {
    try {
      final jsonData = store.toJson();
      _firestore.storeCollectionRef.doc(store.id).update(jsonData);
    } catch (err) {
      return left(StoreFailure.unexpected(err));
    }
    return right(unit);
  }

  @override
  Future<Either<StoreFailure, Unit>> delete(String storeId) async {
    try {
      await _firestore.storeCollectionRef.doc(storeId).delete();
      return right(unit);
    } catch (err) {
      return left(StoreFailure.unexpected(err));
    }
  }
}
