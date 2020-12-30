// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' as _dz;
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:fluttertaladsod/infrastucture/core/json_converters.dart';
import 'package:fluttertaladsod/infrastucture/store/location/store_location_dto.dart';
import 'package:fluttertaladsod/infrastucture/store/preferences/store_prefs_dto.dart';

part 'store_dto.freezed.dart';
part 'store_dto.g.dart';

@freezed
abstract class StoreDto implements _$StoreDto {
  const factory StoreDto({
    @JsonKey(ignore: true) String id,
    @required @nullable String name,
    @required @nullable String menu,
    @required @nullable String banner,
    @required @nullable List<String> pics,
    @required @nullable String ownerId,
    @required StoreLocationDto location,
    @required StorePrefsDto prefs,
    @required @ServerTimestampConverter() FieldValue serverTimeStamp,
    @required @nullable Map<String, bool> blockedUsers,
  }) = _StoreDto;

  factory StoreDto.fromDomain(Store s) {
    return StoreDto(
      id: s.id.getOrCrash(),
      ownerId: s.ownerId.getOrCrash(),
      name: s.name.getOrCrash(),
      menu: s.menu.getOrCrash(),
      banner: s.banner.getOrCrash(),
      pics: s.pics
          .getOrCrash()
          .map(
            (storePic) => storePic.getOrCrash(),
          )
          .toList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
      location: StoreLocationDto.fromDomain(s.location),
      prefs: StorePrefsDto.fromDomain(s.prefs),
      blockedUsers: s.blockedUsers,
    );
  }

  Store toDomain(LocationDomain l, _dz.Option<UserDomain> u) {
    return Store(
      id: UniqueId.fromUniqueString(id),
      name: StoreName(name),
      menu: StoreMenu(menu),
      banner: StoreBanner(banner),
      pics: StorePic16(pics?.map((url) => StorePic(url))?.toList()),
      ownerId: UniqueId.fromUniqueString(ownerId),
      location: location.toDomain(l),
      prefs: prefs.toDomain(),
      isOwner: u.fold(() => false, (u) => u.id.getOrCrash() == ownerId),
      blockedUsers: blockedUsers ?? {},
    );
  }

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);

  factory StoreDto.fromFirestore({
    @required DocumentSnapshot snap,
  }) {
    return StoreDto.fromJson(snap.data()).copyWith(id: snap.id);
  }

  const StoreDto._();
}
