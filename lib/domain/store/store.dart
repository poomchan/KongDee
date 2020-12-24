import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_generators.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/store_location.dart';
import 'package:fluttertaladsod/domain/store/store_pref.dart';
import 'package:fluttertaladsod/domain/store/validators.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@immutable
@freezed
abstract class Store implements _$Store {
  const factory Store({
    @JsonKey(ignore: true) String id,
    @JsonKey(ignore: true) bool isOwner,
    @required @JsonKey(defaultValue: '') String ownerId,
    @required @JsonKey(defaultValue: '') String name,
    @required @JsonKey(defaultValue: '') String banner,
    @required @JsonKey(defaultValue: '') String menu,
    @required @JsonKey(defaultValue: []) List<String> pics,
    @required @JsonKey(defaultValue: {}) Map<String, bool> blockedUsers,
    @required StoreLocation location,
    @required StorePrefs prefs,
  }) = _Store;

  static const nameLength = 50;
  static const menuLength = 1000;
  static const picListLength = 6;

  factory Store.created() => Store(
        id: UniqueId().toString(),
        ownerId: UniqueId().toString(),
        isOwner: true,
        name: '',
        banner:
            'https://via.placeholder.com/700x650.png?text=Click+here+to+add+an+image',
        menu: '',
        pics: List.empty(),
        location: StoreLocation.created(),
        prefs: StorePrefs.created(),
        blockedUsers: {},
      );

  factory Store.fromFirestore(
    DocumentSnapshot snap, {
    @required LocationDomain l,
    @required Option<UserDomain> userOption,
  }) {
    final s = Store.fromJson(snap.data());
    return s.copyWith(
      id: snap.id,
      isOwner: userOption.fold(() => false, (user) => user.id == s.ownerId),
      location: s.location.copyWith(
        distanceAway: s.location.geoFirePoint.distance(
          lat: l.geoFirePoint.latitude,
          lng: l.geoFirePoint.longitude,
        ),
      ),
    );
  }

  double distanceFrom(GeoPoint geoPoint) {
    return location.geoFirePoint.distance(
      lat: geoPoint.latitude,
      lng: geoPoint.longitude,
    );
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return validateStoreName(name)
        .andThen(validateStoreMenu(menu))
        .andThen(validateStorePics(pics))
        .fold(
          (f) => some(f),
          (ok) => none(),
        );
  }

  bool get isValid => failureOption.isNone();

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  const Store._();
}
