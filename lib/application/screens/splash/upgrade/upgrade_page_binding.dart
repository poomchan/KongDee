// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/splash/upgrade/upgrade_bloc.dart';

class UpgradePB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradeBloc());
  }
}
