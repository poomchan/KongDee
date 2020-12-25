import 'package:fluttertaladsod/application/screens/splash/upgrade/upgrade_bloc.dart';
import 'package:get/get.dart';

class UpgradeSplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradeBloc());
  }

}