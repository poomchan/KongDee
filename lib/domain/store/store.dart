// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/preferences/store_pref.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';

part 'store.freezed.dart';

@immutable
@freezed
abstract class Store implements _$Store {
  const factory Store({
    @required UniqueId id,
    @required StoreName name,
    @required StoreBanner banner,
    @required StoreMenu menu,
    @required StorePic16 pics,
    @required UniqueId ownerId,
    @required StoreLocation location,
    @required StorePrefs prefs,
    @required bool isOwner,
    @required Map<String, bool> blockedUsers,
  }) = _Store;

  double distanceFrom(GeoPoint geoPoint) {
    return location.geoFirePoint.distance(
      lat: geoPoint.latitude,
      lng: geoPoint.longitude,
    );
  }

  factory Store.created() => Store(
        id: UniqueId.generated(),
        ownerId: UniqueId.generated(),
        name: StoreName(''),
        banner: StoreBanner.created(),
        menu: StoreMenu(''),
        pics: StorePic16(List.empty()),
        location: StoreLocation.empty(),
        prefs: StorePrefs.created(),
        isOwner: true,
        blockedUsers: {},
      );

  Option<ValueFailure> get failureOption {
    return name.failureOrUnit
        .andThen(menu.failureOrUnit)
        .andThen(pics.failureOrUnit)
        .fold((f) => some(f), (r) => none());
  }

  bool get isValid => failureOption.isNone();

  const Store._();
}
