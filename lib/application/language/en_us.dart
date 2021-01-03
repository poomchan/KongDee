
import 'dart:ui';

import 'translation_base.dart';

class EnUSTr extends TrBase {
  const EnUSTr() : super('en_US');
  static Locale get locale => const Locale('en','US');

  @override
  String trStoreCloseToYou() => 'Store close to you';
}