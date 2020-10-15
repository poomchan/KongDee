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
    MaterialRoute(page: HomePage),
    MaterialRoute(page: AppOnboardingPage, initial: true),
    MaterialRoute(page: SignInSplash, fullscreenDialog: true),
    MaterialRoute(page: ProfilePage),
    MaterialRoute(page: StoreForm),
    MaterialRoute(page: StoreViewPage),
    MaterialRoute(page: ChatPage),
  ],
)
class $Router {}
