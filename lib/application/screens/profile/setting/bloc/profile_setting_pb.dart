import 'package:fluttertaladsod/application/screens/profile/setting/bloc/blocked_store_bloc.dart';
import 'package:get/instance_manager.dart';

class ProfileSettingPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileSettingPB());
    Get.lazyPut(() => BlockedStoreBloc());
  }

}