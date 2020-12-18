import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/home_page/bloc/home_page_binding.dart';
import 'package:fluttertaladsod/application/screens/home_page/home_page.dart';
import 'package:fluttertaladsod/application/screens/profile/bloc/profile_page_binding.dart';
import 'package:fluttertaladsod/application/screens/profile/profile_page.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/bloc/profile_setting_pb.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/blocked_store_setting.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/language.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/profile_setting_page.dart';
import 'package:fluttertaladsod/application/screens/splash/sign_in/sign_in_page_binding.dart';
import 'package:fluttertaladsod/application/screens/splash/sign_in/sign_in_splash.dart';
import 'package:fluttertaladsod/application/screens/splash/start_up_splash.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/chat_page_binding.dart';
import 'package:fluttertaladsod/application/screens/store/chat/chat_page.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_page_binding.dart';
import 'package:fluttertaladsod/application/screens/store/form/store_form.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_page_binding.dart';
import 'package:fluttertaladsod/application/screens/store/setting/features/location_setting.dart';
import 'package:fluttertaladsod/application/screens/store/setting/features/selling_range_setting.dart';
import 'package:fluttertaladsod/application/screens/store/setting/store_setting_page.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_page_binding.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/store_view_page2.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:get/route_manager.dart';
import '../screens/onboarding/onboarding_page.dart';

// ignore: avoid_classes_with_only_static_members
class Router {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.startUpSplash,
      transition: Transition.topLevel,
      page: () => StartUpSplash(),
    ),
    GetPage(
      name: Routes.onboardingPage,
      page: () => OnboardingPage(),
      transition: Transition.native,
    ),
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
      binding: HomePB(),
      transition: Transition.topLevel,
      curve: Curves.fastOutSlowIn,
      transitionDuration: Duration(milliseconds: 5000),
    ),
    GetPage(
      name: Routes.profilePage,
      page: () => ProfilePage(
        userId: Get.arguments as UniqueId,
      ),
      binding: ProfilePB(),
      transition: Transition.fadeIn,
      curve: Curves.fastOutSlowIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.storeViewPage,
      page: () => StoreViewPage2(
        storeId: Get.arguments as UniqueId,
      ),
      binding: StoreViewPB(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.storeForm,
      page: () => StoreForm(
        initialStore: Get.arguments as Option<Store>,
      ),
      binding: StoreFormPB(),
      transitionDuration: Duration(milliseconds: 500),
      popGesture: false,
    ),
    GetPage(
      name: Routes.storeSettingPage,
      page: () => StoreSettingPage(),
      binding: StoreSettingPB(),
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.chatPage,
      page: () => ChatPage(),
      binding: ChatPB(),
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.profileSettingPage,
      page: () => ProfileSettingPage(),
      binding: ProfileSettingPB(),
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.languageSettingPage,
      page: () => LanguageSetting(),
    ),
    GetPage(
      name: Routes.locationSettingPage,
      page: () => LocationSetting(),
    ),
    GetPage(
      name: Routes.sellingRangeSettingPage,
      page: () => SellingRangePage(),
    ),
    GetPage(
      name: Routes.signInSplash,
      page: () => SignInSplash(),
      binding: SignInPB(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: Routes.blockedStoreSettingPage,
      page: () => BlockedStoreSetting(),
    ),
  ];
}

class Routes {
  static const startUpSplash = '/start-splash';
  static const homePage = '/home';
  static const onboardingPage = '/onboarding';
  static const signInSplash = '/sign-in';
  static const profilePage = '/profile';
  static const storeForm = '/store-form';
  static const chatPage = '/chat';
  static const profileSettingPage = '/profile-setting';
  static const languageSettingPage = '/language-setting';
  static const storeViewPage = '/store-view';
  static const storeSettingPage = '/store-setting';
  static const locationSettingPage = '/location-setting';
  static const sellingRangeSettingPage = '/selling-range-setting';
  static const blockedStoreSettingPage = '/blocked-store-setting-page';
}
