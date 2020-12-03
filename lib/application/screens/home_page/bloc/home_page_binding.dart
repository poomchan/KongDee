
import 'package:fluttertaladsod/application/screens/home_page/bloc/store_feed/nearby/near_store_bloc.dart';
import 'package:get/get.dart';

class HomePB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NearStoreBloc());
  }

}