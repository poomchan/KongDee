

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/auth/actor/auth_actor_cubit.dart';
import 'package:fluttertaladsod/application/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/application/location/permission/location_permission_cubit.dart';
import 'package:fluttertaladsod/application/store/store_own_watcher/cubit/owned_store_watcher_cubit.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart' as _router;
import 'package:fluttertaladsod/presentation/screens/app_landing_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationPermissionCubit>(
          create: (context) =>
              getIt<LocationPermissionCubit>()..checkPermissionStatus(),
        ),
        BlocProvider<LocationCubit>(
          create: (context) => getIt<LocationCubit>(),
        ),
        BlocProvider<AuthWatcherCubit>(
          create: (context) => getIt<AuthWatcherCubit>()..watchUser(),
        ),
        BlocProvider<AuthActorCubit>(
          create: (context) => getIt<AuthActorCubit>(),
        ),
        BlocProvider<OwnedStoreWatcherCubit>(
          create: (context) => getIt<OwnedStoreWatcherCubit>(),
        ),
      ],
      child: MaterialApp(
        builder: ExtendedNavigator.builder<_router.Router>(
            router: _router.Router(), initialRoute: _router.Routes.appLandingPage),
        onGenerateRoute: _router.Router(),
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: 'Kong Dee',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.green[400],
          accentColor: Colors.redAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto',
          textTheme: Typography.blackCupertino,
        ),
        home: AppLandingPage(),
      ),
    );
  }
}
