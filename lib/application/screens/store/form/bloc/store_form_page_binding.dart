// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';

class StoreFormPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreFormBloc());
  }

}
