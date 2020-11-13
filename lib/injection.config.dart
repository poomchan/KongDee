// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'application/auth/actor/auth_actor_cubit.dart';
import 'application/auth/watcher/auth_watcher_cubit.dart';
import 'application/store/chat/form/chat_form_cubit.dart';
import 'infrastucture/auth/firebase_auth_facade.dart';
import 'infrastucture/core/firebase_injectable_module.dart';
import 'domain/auth/i_auth_facade.dart';
import 'domain/store/i_image_repository.dart';
import 'domain/location/i_location_repository.dart';
import 'domain/message/i_message_repository.dart';
import 'domain/store/i_store_repository.dart';
import 'infrastucture/core/image_injectable_module.dart';
import 'infrastucture/store/image_repository.dart';
import 'application/location/location_cubit.dart';
import 'infrastucture/location/location_injectable_modules.dart';
import 'application/location/permission/location_permission_cubit.dart';
import 'infrastucture/location/location_repository.dart';
import 'infrastucture/chat/message_repository.dart';
import 'application/store/store_own_watcher/owned_store_watcher_cubit.dart';
import 'application/store/chat/watcher/store_chat_watcher_cubit.dart';
import 'application/store/store_form/store_form_cubit.dart';
import 'application/store/store_form/store_form_location/store_form_location_cubit.dart';
import 'application/home/store_feed/nearby/store_near_cubit.dart';
import 'application/store/prefs/actor/store_prefs_actor_cubit.dart';
import 'infrastucture/store/store_repository.dart';
import 'application/store/store_view/store_view_cubit.dart';

/// Environment names
const _prod = 'prod';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final locationInjectableModule = _$LocationInjectableModule();
  final imageInjectableModule = _$ImageInjectableModule();
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore);
  gh.lazySingleton<Geoflutterfire>(
      () => locationInjectableModule.geoFlutterFire);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(
      () => FirebaseAuthFacade(get<GoogleSignIn>(), get<FirebaseAuth>()),
      registerFor: {_prod});
  gh.lazySingleton<IMessageRepository>(
      () => MessageRepository(get<FirebaseFirestore>()));
  gh.lazySingleton<ImagePicker>(() => imageInjectableModule.imagePicker);
  gh.lazySingleton<Location>(() => locationInjectableModule.location);
  gh.lazySingleton<StorageReference>(
      () => firebaseInjectableModule.firebaseStorage);
  gh.factory<StoreChatWatcherCubit>(() =>
      StoreChatWatcherCubit(get<IMessageRepository>(), get<IAuthFacade>()));
  gh.factory<AuthActorCubit>(() => AuthActorCubit(get<IAuthFacade>()));
  gh.factory<AuthWatcherCubit>(() => AuthWatcherCubit(get<IAuthFacade>()));
  gh.factory<ChatFormCubit>(
      () => ChatFormCubit(get<IMessageRepository>(), get<IAuthFacade>()));
  gh.lazySingleton<IImageRepository>(() => ImageRepository(get<ImagePicker>()),
      registerFor: {_prod});
  gh.lazySingleton<ILocationRepository>(
      () => LocationRepository(get<Location>(), get<Geoflutterfire>()),
      registerFor: {_prod});
  gh.lazySingleton<IStoreRepository>(
      () => StoreRepository(
            get<FirebaseFirestore>(),
            get<StorageReference>(),
            get<Geoflutterfire>(),
          ),
      registerFor: {_prod});
  gh.factory<LocationCubit>(() => LocationCubit(get<ILocationRepository>()));
  gh.factory<LocationPermissionCubit>(
      () => LocationPermissionCubit(get<ILocationRepository>()));
  gh.factory<OwnedStoreWatcherCubit>(() => OwnedStoreWatcherCubit(
      get<IStoreRepository>(), get<ILocationRepository>()));
  gh.factory<StoreFormCubit>(
      () => StoreFormCubit(
            get<IImageRepository>(),
            get<IStoreRepository>(),
            get<IAuthFacade>(),
            get<ILocationRepository>(),
          ),
      registerFor: {_prod});
  gh.factory<StoreFormLocationCubit>(
      () => StoreFormLocationCubit(get<ILocationRepository>()));
  gh.factory<StoreNearCubit>(() => StoreNearCubit(
        get<IStoreRepository>(),
        get<ILocationRepository>(),
        get<IAuthFacade>(),
      ));
  gh.factory<StorePrefsActorCubit>(
      () => StorePrefsActorCubit(get<IStoreRepository>()));
  gh.factory<StoreViewCubit>(() => StoreViewCubit(get<IStoreRepository>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

class _$LocationInjectableModule extends LocationInjectableModule {}

class _$ImageInjectableModule extends ImageInjectableModule {}
