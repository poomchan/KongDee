// Package imports:
import 'package:get/instance_manager.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/profile/setting/bloc/blocked_store_bloc.dart';

class ProfileSettingPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileSettingPB());
    Get.lazyPut(() => BlockedStoreBloc());
  }

}
