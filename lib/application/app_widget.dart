// Flutter imports:
import 'package:flutter/material.dart' hide Router;
import 'package:fluttertaladsod/application/language/en_us.dart';
import 'package:fluttertaladsod/application/language/th.dart';
import 'package:fluttertaladsod/application/language/translation.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/app_binding.dart';
import 'package:fluttertaladsod/application/core/theme.dart';
import 'package:fluttertaladsod/application/routes/router.dart';

class AppWidget extends StatelessWidget {
  static const ColorScheme colorScheme = tLightThemeColorScheme;

  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslation(),
      locale: ThaiTr.locale,
      fallbackLocale: EnglishUSTr.locale,
      getPages: Router.pages,
      initialRoute: Routes.startUpSplash,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Kong Dee',
      theme: ThemeData(
        colorScheme: colorScheme,
        brightness: colorScheme.brightness,
        primaryColor: colorScheme.primary,
        accentColor: colorScheme.secondary,
        backgroundColor: colorScheme.background,
        errorColor: colorScheme.error,
        primaryTextTheme: TextTheme(),
        accentTextTheme: TextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        textTheme: TextTheme(),
        buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          buttonColor: colorScheme.secondary,
        ),
      ),
    );
  }
}
