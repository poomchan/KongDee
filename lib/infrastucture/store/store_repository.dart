import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/infrastucture/store/store_dto.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertaladsod/infrastucture/core/firestore_helper.dart';

@prod
@LazySingleton(as: IStoreRepository)
class StoreRepository implements IStoreRepository {
  final FirebaseFirestore _firestore;
  final StorageReference _storage;
  final Geoflutterfire _geo;
  final radius = BehaviorSubject<double>.seeded(0.0);

  StoreRepository(this._firestore, this._storage, this._geo);

  

  @override
  Stream<Either<StoreFailure, List<Store>>> watchNearbyStore(
      BuildContext context,
      {@required double rad}) async* {
    final LocationCubit locationBloc = BlocProvider.of<LocationCubit>(context);
    final LocationDomain location = locationBloc.state.maybeMap(
      success: (state) => state.location,
      orElse: () => throw 'location not granted',
    );

    radius.add(rad);

    yield* radius
        .switchMap((rad) => _geo
            .collection(collectionRef: _firestore.storeCollectionRef)
            .within(
              center: location.geoFirePoint,
              radius: rad,
              field: 'location',
              strictMode: true,
            ))
        .map(
      (snapshots) {
        if (snapshots.isEmpty) {
          return left<StoreFailure, List<Store>>(StoreFailure.noStore());
        }
        // print('store repo: snap len is : ${snapshots.length}');
        return right<StoreFailure, List<Store>>(
          snapshots
              .map(
                (snapshot) => StoreDto.fromFirestore(snapshot).toDomain(),
              )
              .toList(),
        );
      },
    ).handleError(
      (err) => left<StoreFailure, List<Store>>(StoreFailure.unexpected()),
    );
  }

  @override
  Stream<Either<StoreFailure, Store>> watchOwnedStore(String ownerId) async* {
    yield* _firestore.storeCollectionRef
        .where('ownerId', isEqualTo: ownerId)
        .snapshots()
        .map((snapshot) {
      final hasEmtyStore = snapshot.docs.isEmpty;
      if (hasEmtyStore) {
        // print('no store');
        return left<StoreFailure, Store>(StoreFailure.noStore());
      }
      // print('has store');
      return right<StoreFailure, Store>(snapshot.docs
          .map(
            (document) {
              return StoreDto.fromFirestore(document).toDomain();
            },
          )
          .toList()
          .first);
    }).handleError((err) {
      // print error onto the console here
      return left<StoreFailure, Store>(StoreFailure.unexpected());
    });
  }

  @override
  Future<Either<StoreFailure, Unit>> create(
      Store store, LocationDomain location) async {
    final userDoc = await _firestore.userDocument();
    final jsonData = StoreDto.fromDomain(store).toJson()
      ..addEntries(
        [
          MapEntry('location', location.geoFirePoint.data),
          MapEntry('ownerId', userDoc.id),
        ],
      );
    try {
      _firestore.storeCollectionRef.doc(UniqueId().getOrCrash()).set(jsonData);
    } catch (err) {
      return left(StoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<StoreFailure, Unit>> update(
      Store store, LocationDomain location) async {
    final jsonData = StoreDto.fromDomain(store).toJson()
      ..addEntries([MapEntry('location', location.geoFirePoint.data)]);

    try {
      _firestore.storeCollectionRef.doc(UniqueId().getOrCrash()).set(jsonData);
    } catch (err) {
      return left(StoreFailure.unexpected());
    }
    return right(unit);
  }

  @override
  Future<Either<StoreFailure, Unit>> delete(UniqueId storeId) async {
    // TODO: implement delete
    throw UnimplementedError();
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
      return left(StoreFailure.unexpected());
    }
  }

  @override
  Stream<Either<StoreFailure, Store>> watchSingleStore(String storeId) async* {
    yield* _firestore.storeCollectionRef.doc(storeId).snapshots().map((doc) {
      final hasStore = doc.exists;
      if (!hasStore) {
        // print('no store');
        return left<StoreFailure, Store>(StoreFailure.noStore());
      }
      // print('has store');
      return right<StoreFailure, Store>(StoreDto.fromFirestore(doc).toDomain());
    }).handleError((err) {
      // print error onto the console here
      return left<StoreFailure, Store>(StoreFailure.unexpected());
    });
  }

  @override
  void addMoreRadius(double rad) {
    radius.add(rad);
  }
}
