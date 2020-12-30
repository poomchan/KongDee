// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/routes/router.dart';

class AuthGuardMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String route) {
    final AuthBloc _authBloc = Get.find();
    if (!_authBloc.isAuth) {
      print('not auth =(');
      return RouteSettings(name: Routes.signInSplash);
    } else {
      print('auth!');
      return RouteSettings(name: route);
    }
  }

  
}
