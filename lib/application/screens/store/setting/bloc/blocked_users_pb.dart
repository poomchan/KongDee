// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'blocked_users_bloc.dart';

class BlockedUsersSettingPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlockedUsersSettingBloc());
  }

}
