import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/theme.dart';
import 'package:fluttertaladsod/application/global_bloc/auth/actor/auth_actor_cubit.dart';
import 'package:fluttertaladsod/application/global_bloc/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/application/routes/route_guards.dart';
import 'package:fluttertaladsod/application/routes/router.gr.dart' as _router;
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  final bool isLocationGranted;

  static const ColorScheme colorScheme = tLightThemeColorScheme;

  const AppWidget({Key key, @required this.isLocationGranted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('building the entire app widget...');
    Get.lazyPut(() => AuthActorCubit());
    Get.put(AuthWatcherCubit()).watchUser();
    return MaterialApp(
      builder: ExtendedNavigator.builder<_router.Router>(
        router: _router.Router(),
        initialRoute: isLocationGranted
            ? _router.Routes.homePage
            : _router.Routes.onboardingPage,
        guards: [
          AuthGuard(),
          LocationPermGuard(),
        ],
      ),
      onGenerateRoute: _router.Router(),
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
