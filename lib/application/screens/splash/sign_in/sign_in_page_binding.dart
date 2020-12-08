

import 'package:fluttertaladsod/application/screens/splash/sign_in/sign_in_bloc.dart';
import 'package:get/get.dart';

class SignInPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInBloc());
  }

}