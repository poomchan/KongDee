import 'package:auto_route/auto_route.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';

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
