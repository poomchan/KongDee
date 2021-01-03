// Package imports:
import 'package:fluttertaladsod/application/bloc/language/language_bloc.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/location/location_bloc.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/chat/i_chat_repository.dart';
import 'package:fluttertaladsod/domain/image/i_image_repository.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/report/i_report_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/user/i_user_repository.dart';
import 'package:fluttertaladsod/infrastucture/auth/firebase_auth_facade.dart';
import 'package:fluttertaladsod/infrastucture/chat/chat_repository.dart';
import 'package:fluttertaladsod/infrastucture/core/injectable_modules.dart';
import 'package:fluttertaladsod/infrastucture/image/image_repository.dart';
import 'package:fluttertaladsod/infrastucture/location/location_repository.dart';
import 'package:fluttertaladsod/infrastucture/report/report_repository.dart';
import 'package:fluttertaladsod/infrastucture/store/store_repository.dart';
import 'package:fluttertaladsod/infrastucture/user/user_repository.dart';
import 'package:get_storage/get_storage.dart';

class AppBinding extends Bindings {
  final m = InjectMod();
  @override
  void dependencies() {
    ///  third party dependencies
    Get.lazyPut(() => m.firebaseAuth, fenix: true);
    Get.lazyPut(() => m.firebaseFirestore, fenix: true);
    Get.lazyPut(() => m.firebaseStorage, fenix: true);
    Get.lazyPut(() => m.googleSignIn, fenix: true);
    Get.lazyPut(() => m.geoFlutterFire, fenix: true);
    Get.lazyPut(() => m.geocoding, fenix: true);
    Get.lazyPut(() => m.location, fenix: true);
    Get.lazyPut(() => m.imagePicker, fenix: true);

    /// App Interfaces
    Get.lazyPut<ILocationRepository>(() => LocationRepository(), fenix: true);
    Get.lazyPut<IAuthFacade>(() => FirebaseAuthFacade(), fenix: true);
    Get.lazyPut<IStoreRepository>(() => StoreRepository(), fenix: true);
    Get.lazyPut<IImageRepository>(() => ImageRepository(), fenix: true);
    Get.lazyPut<IChatRepository>(() => ChatRepository(), fenix: true);
    Get.lazyPut<IUserRepository>(() => UserRepository(), fenix: true);
    Get.lazyPut<IReportRepository>(() => ReportRepository(), fenix: true);

    /// Global Blocs
    Get.put(GetStorage());
    Get.put(AuthBloc());
    Get.put(LocationBloc());
    Get.put(LanguageBloc());
  }
}

class MessageRepository {
}

class InjectMod extends InjectableModule {}
