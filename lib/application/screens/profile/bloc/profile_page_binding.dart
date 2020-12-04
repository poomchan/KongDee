

import 'package:get/get.dart';
import 'owened_store/owned_store_watcher_cubit.dart';

class ProfilePB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OwnedStoreBloc());
  }

}