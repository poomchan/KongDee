import 'package:fluttertaladsod/application/screens/profile/bloc/profile_bloc.dart';
import 'package:get/get.dart';
import 'owned_store_bloc.dart';

class ProfilePB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OwnedStoreBloc());
    Get.lazyPut(() => ProfileBloc());
  }
}
