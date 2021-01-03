import 'package:get/get.dart' show Translations;
import 'en_US.dart';
import 'th.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {}..addAll(const EnglishUSTr().trMap)..addAll(const ThaiTr().trMap);
  }
}
