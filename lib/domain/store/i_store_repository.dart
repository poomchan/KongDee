import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:rxdart/rxdart.dart';

abstract class IStoreRepository {
  Stream<Either<StoreFailure, Store>> watchOwnedStore({
    @required UniqueId ownerId,
    @required LocationDomain location,
  });
  Stream<Either<StoreFailure, List<Store>>> watchNearbyStore({
    @required double rad,
    @required LocationDomain location,
    @required BehaviorSubject<double> radius,
  });

  Stream<Either<StoreFailure, Store>> watchSingleStore({
    @required UniqueId storeId,
    @required LocationDomain location,
  });

  Future<Either<StoreFailure, String>> uploadFileImage(File img, String path);

  Future<Either<StoreFailure, Unit>> create(
    Store store,
    LocationDomain location,
  );
  Future<Either<StoreFailure, Unit>> update(
    Store store, {
    LocationDomain location,
  });
  Future<Either<StoreFailure, Unit>> delete(UniqueId storeId);
}
