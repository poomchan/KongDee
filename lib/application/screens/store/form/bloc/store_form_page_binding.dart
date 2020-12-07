import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:get/get.dart';

class StoreFormPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreFormBloc());
  }

}