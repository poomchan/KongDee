import 'dart:ui';

import 'translation_base.dart';

class ThaiTr extends TrBase {
  const ThaiTr() : super('th');
  static Locale get locale => const Locale('th');

  @override
  String trStoreCloseToYou() => 'ร้านค้าใกล้ๆคุณ';
}