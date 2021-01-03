import 'dart:ui';

import 'package:fluttertaladsod/application/bloc/core/state_setter.dart';
import 'package:fluttertaladsod/application/bloc/language/language_state.dart';
import 'package:fluttertaladsod/application/language/en_US.dart';
import 'package:fluttertaladsod/application/language/th.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageBloc extends GetxController
    with MyStateSetter<LanguageState, dynamic> {
  final GetStorage storage = Get.find();

  Locale get currentLocale => Get.locale;
  String get currentLangName {
    if (currentLocale == ThaiTr.locale) {
      return ThaiTr.langName;
    } else if (currentLocale == EnglishUSTr.locale) {
      return EnglishUSTr.langName;
    } else {
      throw 'Locale not found';
    }
  }

  void onThaiChanged() {
    Get.updateLocale(ThaiTr.locale);
    storage.write('locale', ThaiTr.locale.languageCode);
    setLoaded(LanguageState(isThai: true));
  }

  void onEnglishUSChanged() {
    Get.updateLocale(EnglishUSTr.locale);
    storage.write('locale', EnglishUSTr.locale.languageCode);
    setLoaded(LanguageState(isEnglishUS: true));
  }

  @override
  void onInit() {
    final String langCode = storage.read('locale');
    print(langCode);
    final code = langCode ?? Get.locale.languageCode;
    if (code == ThaiTr.locale.languageCode) {
      Get.updateLocale(ThaiTr.locale);
      setLoaded(LanguageState(isThai: true));
    } else if (code == EnglishUSTr.locale.languageCode) {
      Get.updateLocale(EnglishUSTr.locale);
      setLoaded(LanguageState(isEnglishUS: true));
    }
    super.onInit();
  }
}
