import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/preferences/store_pref.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _Store;

  double distanceFrom(GeoPoint geoPoint) {
    return location.geoFirePoint.distance(
      lat: geoPoint.latitude,
      lng: geoPoint.longitude,
    );
  }

  factory Store.created() => Store(
        id: UniqueId(),
        ownerId: UniqueId(),
        name: StoreName(''),
        banner: StoreBanner.url(
          'https://via.placeholder.com/700x650.png?text=Click+here+to+add+an+image',
        ),
        menu: StoreMenu(''),
        pics: StorePic16(List.empty()),
        location: StoreLocation.created(),
        prefs: StorePrefs.created(),
        isOwner: true,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(menu.failureOrUnit)
        .andThen(pics.failureOrUnit)
        .fold((f) => some(f), (r) => none());
  }

  const Store._();
}
