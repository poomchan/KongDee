import 'package:auto_route/auto_route_annotations.dart';
import 'package:fluttertaladsod/presentation/routes/route_guards.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/home_page.dart';
import 'package:fluttertaladsod/presentation/screens/profile/profile_page.dart';
import 'package:fluttertaladsod/presentation/screens/setting_page/language.dart';
import 'package:fluttertaladsod/presentation/screens/setting_page/profile_setting.dart';
import 'package:fluttertaladsod/presentation/screens/splash/sign_in_splash.dart';
import 'package:fluttertaladsod/presentation/screens/store/chat/chat_page.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/store_form.dart';
import 'package:fluttertaladsod/presentation/screens/store/setting/store_setting_page.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/store_view_page2.dart';
import '../screens/onboarding/app_onboarding_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    AdaptiveRoute(page: HomePage),
    AdaptiveRoute(page: AppOnboardingPage, initial: true),
    AdaptiveRoute(page: SignInSplash, fullscreenDialog: true),
    AdaptiveRoute(page: ProfilePage),
    AdaptiveRoute(page: StoreForm),
    AdaptiveRoute(page: ChatPage, guards: [AuthGuard]),
    AdaptiveRoute(page: ProfileSettingPage),
    AdaptiveRoute(page: LanguageSetting),
    AdaptiveRoute(page: StoreViewPage2),
    AdaptiveRoute(page: StoreSettingPage),
  ],
)
class $Router {}
