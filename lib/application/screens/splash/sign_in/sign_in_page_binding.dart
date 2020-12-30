

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/splash/sign_in/sign_in_bloc.dart';

class SignInPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInBloc());
  }

}
