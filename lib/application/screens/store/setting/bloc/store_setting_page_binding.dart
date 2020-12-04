
import 'package:get/get.dart';
import 'store_setting_bloc.dart';

class StoreSettingPB extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreSettingBloc());
  }

}