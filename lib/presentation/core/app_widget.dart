import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/auth/actor/auth_actor_cubit.dart';
import 'package:fluttertaladsod/application/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/application/location/permission/location_permission_cubit.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/core/unknown_page.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart' as _router;
import 'package:fluttertaladsod/presentation/screens/onboarding/app_onboarding_page.dart';

class AppWidget extends StatelessWidget {

  final ColorScheme colorScheme = ColorScheme.light(
            brightness: Brightness.light,
            primary: Color(0xFF3949AB),
            secondary: Color(0xFFFFCA28),
            primaryVariant: Color(0xFF002884),
            secondaryVariant: Color(0xFFC8A415),
            surface: Color(0xFFFFFFFF),
            background: Color(0xFFe8eaf6),
            error: Colors.red,
            onPrimary: Color(0xFFFFFFFF),
            onSecondary: Colors.black,
            onSurface: Colors.black,
            onBackground: Colors.black,
            onError: Colors.white,
          );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationPermissionCubit>(
          create: (context) =>
              getIt<LocationPermissionCubit>()..checkPermissionStatus(),
        ),
        BlocProvider<AuthWatcherCubit>(
          create: (context) => getIt<AuthWatcherCubit>()..watchUser(),
        ),
        BlocProvider<AuthActorCubit>(
          create: (context) => getIt<AuthActorCubit>(),
        ),
      ],
      child: MaterialApp(
        builder: ExtendedNavigator.builder<_router.Router>(
          router: _router.Router(),
          initialRoute: _router.Routes.appOnboardingPage,
        ),
        onGenerateRoute: _router.Router(),
        // initialRoute: _router.Routes.appOnboardingPage,
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
        // routes: {
        //   "/" : (context) => AppOnboardingPage(),
        // },
      ),
    );

  }
}
