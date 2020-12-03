import 'package:flutter/material.dart' hide Router;
import 'package:fluttertaladsod/application/bloc/auth/actor/auth_actor_cubit.dart';
import 'package:fluttertaladsod/application/bloc/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/application/core/theme.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  final bool isLocationGranted;

  static const ColorScheme colorScheme = tLightThemeColorScheme;

  const AppWidget({Key key, @required this.isLocationGranted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthActorCubit());
    Get.put(AuthWatcherCubit()).watchUser();
    return GetMaterialApp(
      getPages: Router.pages,
      initialRoute: Routes.homePage,
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
