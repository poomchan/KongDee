import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/location/location_bloc.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/store/i_image_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/user/i_user_repository.dart';
import 'package:fluttertaladsod/infrastucture/auth/firebase_auth_facade.dart';
import 'package:fluttertaladsod/infrastucture/chat/message_repository.dart';
import 'package:fluttertaladsod/infrastucture/core/injectable_modules.dart';
import 'package:fluttertaladsod/infrastucture/location/location_repository.dart';
import 'package:fluttertaladsod/infrastucture/image/image_repository.dart';
import 'package:fluttertaladsod/infrastucture/store/store_repository.dart';
import 'package:fluttertaladsod/infrastucture/user/user_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings{
  final m = InjectMod();
  @override
  void dependencies() {
    ///  third party dependencies
    Get.lazyPut(() => m.firebaseAuth);
    Get.lazyPut(() => m.firebaseFirestore);
    Get.lazyPut(() => m.firebaseStorage);
    Get.lazyPut(() => m.googleSignIn);
    Get.lazyPut(() => m.geoFlutterFire);
    Get.lazyPut(() => m.geocoding);
    Get.lazyPut(() => m.location);
    Get.lazyPut(() => m.imagePicker);

    /// App Interfaces
    Get.lazyPut<ILocationRepository>(() => LocationRepository());
    Get.lazyPut<IAuthFacade>(() => FirebaseAuthFacade());
    Get.lazyPut<IStoreRepository>(() => StoreRepository());
    Get.lazyPut<IImageRepository>(() => ImageRepository());
    Get.lazyPut<IMessageRepository>(() => MessageRepository());
    Get.lazyPut<IUserRepository>(() => UserRepository());

    /// Global Blocs
    Get.put(AuthBloc());
    Get.put(LocationBloc());
  }
}

class InjectMod extends InjectableModule{}