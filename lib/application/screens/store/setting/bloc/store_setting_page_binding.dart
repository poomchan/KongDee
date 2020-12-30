// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'store_setting_bloc.dart';

class StoreSettingPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreSettingBloc());
  }

}
