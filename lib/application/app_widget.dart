import 'package:flutter/material.dart' hide Router;
import 'package:fluttertaladsod/application/bloc/app_binding.dart';
import 'package:fluttertaladsod/application/core/theme.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  static const ColorScheme colorScheme = tLightThemeColorScheme;

  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.full,
      getPages: Router.pages,
      initialRoute: Routes.startUpSplash,
      initialBinding: AppBinding(),
      debugShowMaterialGrid: false,
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
        buttonTheme: null,
      ),
    );
  }
}
