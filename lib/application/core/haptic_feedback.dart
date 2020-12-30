// Flutter imports:
import 'package:flutter/services.dart';

Future<void> doubleHapticFeedback() async {
  HapticFeedback.lightImpact();
  await Future.delayed(Duration(milliseconds: 100));
  HapticFeedback.mediumImpact();
}
