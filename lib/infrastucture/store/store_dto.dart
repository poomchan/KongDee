import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:fluttertaladsod/infrastucture/core/json_converters.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

part 'store_dto.freezed.dart';
part 'store_dto.g.dart';

@freezed
abstract class StoreDto implements _$StoreDto {
  const StoreDto._();

  const factory StoreDto({
    @JsonKey(ignore: true) String id,
    @required String name,
    @required String menu,
    @required String bannerUrl,
    @required List<String> picUrls,
    @required String ownerId,
    @required int distanceAway,
    @required String formattedAddress,
    @required @ServerTimestampConverter() FieldValue serverTimeStamp,
    @JsonKey(ignore: true) GeoPoint geoPoint,
  }) = _StoreDto;

  factory StoreDto.fromDomain(Store store) {
    return StoreDto(
      id: store.id.getOrCrash(),
      ownerId: store.ownerId.getOrCrash(),
      name: store.name.getOrCrash(),
      menu: store.menu.getOrCrash(),
      bannerUrl: store.banner.getOrCrash().fold(
          (file) => throw 'banner us not uploaded to the cloud', (url) => url),
      picUrls: store.pics
          .getOrCrash()
          .map(
            (storePic) => storePic.fileOrUrl.fold(
                (file) => throw 'some pic are not uploaded to the cloud',
                (url) => url),
          )
          .toList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
      distanceAway: store.distanceAway,
      formattedAddress: store.formattedAddress,
    );
  }

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);

  factory StoreDto.fromFirestore({
    @required DocumentSnapshot snap,
    @required LocationDomain location,
  }) {
    final geoPoint = snap.data()['location']['geopoint'] as GeoPoint;
    final distanceAway = location.geoFirePoint.distance(
      lat: geoPoint.latitude,
      lng: geoPoint.longitude,
    );
    return StoreDto.fromJson(snap.data()).copyWith(
      id: snap.id,
      geoPoint: geoPoint,
      distanceAway: distanceAway.toInt(),
    );
  }

  Store toDomain() {
    return Store(
      id: UniqueId.fromUniqueString(id),
      name: StoreName(name),
      menu: StoreMenu(menu),
      banner: StoreBanner.url(bannerUrl),
      pics: StorePic16(
        List.from(
          picUrls
              .map(
                (url) => StorePic.url(url),
              )
              .toList(),
        ),
      ),
      ownerId: UniqueId.fromUniqueString(ownerId),
      distanceAway: distanceAway,
      formattedAddress: formattedAddress,
      geoPoint: geoPoint,
    );
  }
}
