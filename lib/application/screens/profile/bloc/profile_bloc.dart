import 'package:get/get.dart';

class ProfileBloc extends GetxController {
  void showDiaglog() {
    Get.showSnackbar(GetBar(
      message: 'Hello!',
      duration: Duration(milliseconds: 1500),
    ));
  }
}
