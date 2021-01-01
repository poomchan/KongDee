import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/domain/store/preferences/store_pref.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_form_state.freezed.dart';

@immutable
@freezed
abstract class StoreFormState implements _$StoreFormState {
  const factory StoreFormState({
    @required bool isCreating,
    @required UniqueId storeId,
    @required UniqueId ownerId,
    @required TextEditingController nameController,
    @required TextEditingController menuController,
    @required Either<File, String> banner,
    @required List<Either<File, String>> pics,
    @required StorePrefs storePrefs,
    @required StoreLocation storeLocation,
    @required Map<String, bool> blockedUsers,
  }) = _StoreFormState;

  factory StoreFormState.initialize(
    Option<Store> initStoreOption,
    LocationDomain location,
    UserDomain user,
  ) {
    return initStoreOption.fold(
      () => StoreFormState(
        isCreating: true,
        storeId: UniqueId.generated(),
        ownerId: user.id,
        nameController: TextEditingController(),
        menuController: TextEditingController(),
        banner: right(''),
        pics: const [],
        storePrefs: StorePrefs.created(),
        storeLocation: StoreLocation.fromLocationDomain(location),
        blockedUsers: const {},
      ),
      (store) => StoreFormState(
        isCreating: false,
        storeId: store.id,
        ownerId: store.ownerId,
        nameController: TextEditingController(text: store.name.getOrCrash()),
        menuController: TextEditingController(text: store.menu.getOrCrash()),
        banner: right(store.banner.getOrCrash()),
        pics: store.pics
            .getOrCrash()
            .map((sp) => right<File, String>(sp.getOrCrash()))
            .toList(),
        storePrefs: store.prefs,
        storeLocation: store.location,
        blockedUsers: store.blockedUsers,
      ),
    );
  }

  bool get isStoreValid {
    return nameDomain.isValid() && menuDomain.isValid() && isPicsValid;
  }

  StoreMenu get menuDomain => StoreMenu(menuController.text);
  StoreName get nameDomain => StoreName(nameController.text);
  bool get isPicsValid => pics.length <= StorePic16.maxLength;

  Store get store {
    return Store(
      id: storeId,
      ownerId: ownerId,
      isOwner: true,
      name: StoreName(nameController.text),
      menu: StoreMenu(menuController.text),
      banner: StoreBanner(banner.fold(
        (_) => throw 'banner is not url',
        (url) => url,
      )),
      pics: StorePic16(pics
          .map((fileOrUrl) => StorePic(fileOrUrl.fold(
                (_) => throw 'store pic is not url',
                (url) => url,
              )))
          .toList()),
      prefs: storePrefs,
      location: storeLocation,
      blockedUsers: blockedUsers,
    );
  }

  void dispose() {
    nameController.dispose();
    menuController.dispose();
  }

  const StoreFormState._();
}
