import 'package:auto_route/auto_route_annotations.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/home_page.dart';
import 'package:fluttertaladsod/presentation/screens/profile/profile_page.dart';
import 'package:fluttertaladsod/presentation/screens/splash/sign_in_splash.dart';
import 'package:fluttertaladsod/presentation/screens/store/chat/chat_page.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/store_form.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/store_view_page.dart';

import '../screens/app_onboarding_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    AdaptiveRoute(page: HomePage, path: '/home'),
    AdaptiveRoute(
      page: AppOnboardingPage,
      path: '/',
      initial: true,
    ),
    AdaptiveRoute(
      page: SignInSplash,
      path: '/sign-in',
      fullscreenDialog: true,
    ),
    AdaptiveRoute(page: ProfilePage, path: '/profile'),
    AdaptiveRoute(page: StoreForm, path: '/store-form'),
    AdaptiveRoute(page: StoreViewPage, path: '/store-view'),
    AdaptiveRoute(page: ChatPage, path: '/chat'),
  ],
)
class $Router {}
