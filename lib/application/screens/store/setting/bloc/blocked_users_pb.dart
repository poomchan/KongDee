import 'package:get/get.dart';

import 'blocked_users_bloc.dart';

class BlockedUsersSettingPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlockedUsersSettingBloc());
  }

}