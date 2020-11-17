import 'package:auto_route/auto_route_annotations.dart';
import 'package:fluttertaladsod/application/routes/route_guards.dart';
import 'package:fluttertaladsod/application/screens/home_page/home_page.dart';
import 'package:fluttertaladsod/application/screens/profile/profile_page.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/language.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/profile_setting.dart';
import 'package:fluttertaladsod/application/screens/splash/sign_in_splash.dart';
import 'package:fluttertaladsod/application/screens/store/chat/chat_page.dart';
import 'package:fluttertaladsod/application/screens/store/form/store_form.dart';
import 'package:fluttertaladsod/application/screens/store/setting/features/location_setting.dart';
import 'package:fluttertaladsod/application/screens/store/setting/features/selling_range_setting.dart';
import 'package:fluttertaladsod/application/screens/store/setting/store_setting_page.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/store_view_page2.dart';
import '../screens/onboarding/onboarding_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    AdaptiveRoute(page: HomePage),
    AdaptiveRoute(page: OnboardingPage),
    AdaptiveRoute(page: SignInSplash, fullscreenDialog: true),
    AdaptiveRoute(page: ProfilePage),
    AdaptiveRoute(page: StoreForm),
    AdaptiveRoute(page: ChatPage, guards: [AuthGuard]),
    AdaptiveRoute(page: ProfileSettingPage),
    AdaptiveRoute(page: LanguageSetting),
    AdaptiveRoute(page: StoreViewPage2),
    AdaptiveRoute(page: StoreSettingPage),
    AdaptiveRoute(page: SellingRange),
    AdaptiveRoute(page: LocationSetting),
  ],
)
class $Router {}
