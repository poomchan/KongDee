import 'dart:html';

import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/preferences/store_pref.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_primitive.freezed.dart';

@immutable
@freezed
abstract class StorePrimitive implements _$StorePrimitive{
  const factory StorePrimitive({
    @required UniqueId id,
    @required UniqueId ownerId,
    @required String name,
    @required String menu,
    @required Either<File, String> banner,
    @required List<Either<File, String>> pics,
    @required StorePrefs prefs,
    @required StoreLocation location,
    @required Map<String, bool> blockedUser,
  }) = _StorePrimitive;

  factory StorePrimitive.created({@required UniqueId ownerId}) => StorePrimitive(
    id: UniqueId(),
    ownerId: ownerId,
    name: '',
    menu: '',
    banner: right(''),
    pics: List.empty(),
    prefs: StorePrefs.created(),
    location: StoreLocation.created(),
    blockedUser: {},
  );


  const StorePrimitive._();
}