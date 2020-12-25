import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_generators.dart';
import 'package:fluttertaladsod/domain/store/store_location.dart';
import 'package:fluttertaladsod/domain/store/store_pref.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
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
        id: s.id,
        ownerId: s.ownerId,
        name: s.name,
        menu: s.menu,
        banner: right(s.banner),
        pics: List.generate(s.pics.length, (index) => right(s.pics[index])),
        prefs: s.prefs,
        location: s.location,
        blockedUser: s.blockedUsers,
      );

  Store toDomain() => Store(
        id: this.id,
        ownerId: ownerId,
        name: name,
        menu: menu,
        banner: banner.fold(
          (file) => throw 'banner is not url',
          (url) => url,
        ),
        pics: pics
            .map((fileOrUrl) => fileOrUrl.fold(
                (file) => throw 'pics are not url', (url) => url))
            .toList(),
        prefs: prefs,
        location: location,
        blockedUsers: const {},
      );

  const StorePrimitive._();
}
