import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/application/screens/home_page/bloc/home_page_binding.dart';
import 'package:fluttertaladsod/application/screens/home_page/home_page.dart';
import 'package:fluttertaladsod/application/screens/profile/profile_page.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/language.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/profile_setting_page.dart';
import 'package:fluttertaladsod/application/screens/splash/sign_in_splash.dart';
import 'package:fluttertaladsod/application/screens/store/chat/chat_page.dart';
import 'package:fluttertaladsod/application/screens/store/form/store_form.dart';
import 'package:fluttertaladsod/application/screens/store/setting/features/location_setting.dart';
import 'package:fluttertaladsod/application/screens/store/setting/features/selling_range_setting.dart';
import 'package:fluttertaladsod/application/screens/store/setting/store_setting_page.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/store_view_page2.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:get/route_manager.dart';
import '../screens/onboarding/onboarding_page.dart';

// ignore: avoid_classes_with_only_static_members
class Router {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
      binding: HomePB(),
    ),
    GetPage(
      name: Routes.onboardingPage,
      page: () => OnboardingPage(),
    ),
    GetPage(
      name: Routes.signInSplash,
      page: () => SignInSplash(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: Routes.profilePage,
      page: () => ProfilePage(
        user: Get.arguments as UserDomain,
      ),
    ),
    GetPage(
      name: Routes.storeForm,
      page: () => StoreForm(
        initialStore: Get.arguments as Option<Store>,
      ),
    ),
    GetPage(
      name: Routes.chatPage,
      page: () => ChatPage(
        storeId: Get.arguments as UniqueId,
      ),
    ),
    GetPage(
      name: Routes.profileSettingPage,
      page: () => ProfileSettingPage(),
    ),
    GetPage(
      name: Routes.languageSettingPage,
      page: () => LanguageSetting(),
    ),
    GetPage(
      name: Routes.storeViewPage,
      page: () => StoreViewPage2(
        storeId: Get.arguments as UniqueId,
      ),
    ),
    GetPage(
      name: Routes.storeSettingPage,
      page: () => StoreSettingPage(),
    ),
    GetPage(
      name: Routes.locationSettingPage,
      page: () => LocationSetting(),
    ),
    GetPage(
      name: Routes.sellingRangeSettingPage,
      page: () => SellingRangePage(),
    ),
  ];
}

class Routes {
  static const homePage = '/home';
  static const onboardingPage = '/onboarding';
  static const signInSplash = '/sign-in';
  static const profilePage = '/profile';
  static const storeForm = '/store-form';
  static const chatPage = '/chat';
  static const profileSettingPage = '/profile-setting';
  static const languageSettingPage = '/language-setting';
  static const storeViewPage = '.store-view';
  static const storeSettingPage = 'store-setting';
  static const locationSettingPage = 'location-setting';
  static const sellingRangeSettingPage = 'selling-range-setting';
}
