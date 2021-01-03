
import 'dart:ui';

import 'translation_base.dart';

class EnglishUSTr extends TrBase {
  const EnglishUSTr() : super('en_US');
  static String get langName => 'English(US)';
  static Locale get locale => const Locale('en','US');

  @override
  String trStoreCloseToYou() => 'Store close to you';
}