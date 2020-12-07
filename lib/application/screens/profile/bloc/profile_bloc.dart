import 'package:get/get.dart';

class ProfileBloc extends GetxController {

  void showDiaglog() {
    Get.showSnackbar(GetBar(title: 'Hello!',));
  }
}