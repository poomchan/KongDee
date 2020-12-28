import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/preferences/store_pref.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_primitive.freezed.dart';

@immutable
@freezed
abstract class StorePrimitive implements _$StorePrimitive {
  const factory StorePrimitive({
    @required String id,
    @required String ownerId,
    @required String name,
    @required String menu,
    @required Either<File, String> banner,
    @required List<Either<File, String>> pics,
    @required StorePrefs prefs,
    @required StoreLocation location,
    @required Map<String, bool> blockedUser,
  }) = _StorePrimitive;

  factory StorePrimitive.created({@required String ownerId}) => StorePrimitive(
        id: UniqueId().toString(),
        ownerId: ownerId,
        name: '',
        menu: '',
        banner: right(''),
        pics: List.empty(),
        prefs: StorePrefs.created(),
        location: StoreLocation.created(),
        blockedUser: const {},
      );

  factory StorePrimitive.fromDomain(Store s) => StorePrimitive(
        id: s.id.getOrCrash(),
        ownerId: s.ownerId.getOrCrash(),
        name: s.name.getOrCrash(),
        menu: s.menu.getOrCrash(),
        banner: right(s.banner.getOrCrash()),
        pics: List.generate(s.pics.length,
            (index) => right(s.pics.getOrCrash()[index].getOrCrash())),
        prefs: s.prefs,
        location: s.location,
        blockedUser: s.blockedUsers,
      );

  Store toDomain() => Store(
        id: UniqueId.fromUniqueString(this.id),
        ownerId: UniqueId.fromUniqueString(ownerId),
        name: StoreName(name),
        menu: StoreMenu(menu),
        banner: banner.fold(
          (file) => throw 'banner is not url',
          (url) => StoreBanner(url),
        ),
        pics: StorePic16(pics
            .map(
              (fileOrUrl) => fileOrUrl.fold(
                (file) => throw 'pics are not url',
                (url) => StorePic(url),
              ),
            )
            .toList()),
        prefs: prefs,
        location: location,
        blockedUsers: const {},
        isOwner: true,
      );

  const StorePrimitive._();
}
