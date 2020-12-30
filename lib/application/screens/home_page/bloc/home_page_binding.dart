// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/home_page/bloc/store_feed/near_store_bloc.dart';

class HomePB extends Bindings {
  @override
  void dependencies() {
    Get.put(NearStoreBloc());
  }

}
