import 'package:auto_route/auto_route.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:geolocator/geolocator.dart';

import 'router.gr.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName,
      Object arguments) async {
    final isAuth = getIt<IAuthFacade>().isAuthenticated();
    if (isAuth) {
      return true;
    } else {
      navigator.pushSignInSplash();
      return false;
    }
  }
}

class LocationPermGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState navigator, String routeName,
      Object arguments) async {
    final isGranted = await getIt<ILocationRepository>().isPermissionGranted();
    if (isGranted) {
      return true;
    } else {
      if (routeName != Routes.homePage) {
        Geolocator.openLocationSettings();
      }
      return false;
    }
  }
}
