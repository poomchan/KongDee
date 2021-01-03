import 'package:fluttertaladsod/application/bloc/core/state_setter.dart';
import 'package:fluttertaladsod/application/bloc/language/language_state.dart';
import 'package:fluttertaladsod/application/language/en_us.dart';
import 'package:fluttertaladsod/application/language/th.dart';
import 'package:get/get.dart';

class LanguageBloc extends GetxController
    with MyStateSetter<LanguageState, dynamic> {
  void onThaiChanged() {
    Get.updateLocale(ThaiTr.locale);
    setLoaded(LanguageState(isThai: true));
  }

  void onEnglishUSChanged() {
    Get.updateLocale(EnUSTr.locale);
    setLoaded(LanguageState(isEnglishUS: true));
  }

  @override
  void onInit() {
    final code = Get.locale.languageCode;
    if (code == 'th') {
      setLoaded(LanguageState(isThai: true));
    } else if (code == 'en_US') {
      setLoaded(LanguageState(isEnglishUS: true));
    }
    super.onInit();
  }
}
