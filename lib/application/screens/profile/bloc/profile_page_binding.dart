// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/profile/bloc/profile_bloc.dart';
import 'owned_store_bloc.dart';

class ProfilePB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OwnedStoreBloc());
    Get.lazyPut(() => ProfileBloc());
  }
}
