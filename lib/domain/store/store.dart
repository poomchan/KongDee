import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@immutable
@freezed
abstract class Store implements _$Store {
  const Store._();
  const factory Store({
    @required UniqueId id,
    @required StoreName name,
    @required StoreBanner banner,
    @required StoreMenu menu,
    @required StorePic16 pics,
    @required int distanceAway,
    @required String formattedAddress,
    @required UniqueId ownerId,
    GeoPoint geoPoint,
  }) = _Store;

  factory Store.created() => Store(
        id: UniqueId(),
        ownerId: UniqueId(),
        name: StoreName(''),
        banner: StoreBanner.url(
            'https://via.placeholder.com/700x650.png?text=Click+here+to+add+an+image'),
        menu: StoreMenu(''),
        pics: StorePic16(List.empty()),
        distanceAway: 0,
        formattedAddress: '',
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(menu.failureOrUnit)
        .andThen(pics.failureOrUnit)
        .fold((f) => some(f), (r) => none());
  }

  
}
