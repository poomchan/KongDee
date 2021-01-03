// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/application/screens/home_page/bloc/near_store_bloc.dart';
import 'package:fluttertaladsod/application/screens/profile/bloc/owned_store_bloc.dart';
import 'package:fluttertaladsod/application/screens/profile/bloc/profile_bloc.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/bloc/profile_setting_bloc.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/blocked_store/blocked_store_bloc.dart';
import 'package:fluttertaladsod/application/screens/splash/sign_in/sign_in_bloc.dart';
import 'package:fluttertaladsod/application/screens/splash/upgrade/upgrade_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/action/chat_user_action_sheet_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/input_bar/input_bar_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/message_view/message_view_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/setting/blocked_user/blocked_users_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_action_sheet_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_view_bloc.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/home_page/home_page.dart';
import 'package:fluttertaladsod/application/screens/profile/profile_page.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/blocked_store/blocked_store_setting.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/language/language_setting_page.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/policy_info/policy_info_page.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/profile_setting_page.dart';
import 'package:fluttertaladsod/application/screens/splash/sign_in/sign_in_splash.dart';
import 'package:fluttertaladsod/application/screens/splash/start_up_splash.dart';
import 'package:fluttertaladsod/application/screens/splash/upgrade/upgrade_splash.dart';
import 'package:fluttertaladsod/application/routes/route_guards.dart';
import 'package:fluttertaladsod/application/screens/store/chat/chat_page.dart';
import 'package:fluttertaladsod/application/screens/store/form/store_form.dart';
import 'package:fluttertaladsod/application/screens/store/setting/blocked_user/blocked_user_setting.dart';
import 'package:fluttertaladsod/application/screens/store/setting/location/location_setting.dart';
import 'package:fluttertaladsod/application/screens/store/setting/selling_range/selling_range_setting.dart';
import 'package:fluttertaladsod/application/screens/store/setting/store_setting_page.dart';
import 'package:fluttertaladsod/application/screens/store/view/store_view_page2.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
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
      binding: BindingsBuilder.put(() => Get.put(NearStoreBloc())),
      transition: Transition.topLevel,
      curve: Curves.fastOutSlowIn,
      transitionDuration: Duration(milliseconds: 5000),
    ),
    GetPage(
      name: Routes.profilePage,
      page: () => ProfilePage(
        userId: Get.arguments as UniqueId,
      ),
      binding: BindingsBuilder(() {
        Get.put(OwnedStoreBloc());
        Get.put(ProfileBloc());
      }),
      transition: Transition.fadeIn,
      curve: Curves.fastOutSlowIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.storeViewPage,
      page: () => StoreViewPage2(
        storeId: Get.arguments as UniqueId,
      ),
      binding: BindingsBuilder(() {
        Get.put(StoreViewBloc());
        Get.put(StoreActionSheetBloc());
      }),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.storeForm,
      page: () => StoreForm(
        initialStore: Get.arguments as Option<Store>,
      ),
      binding: BindingsBuilder.put(() => StoreFormBloc()),
      transitionDuration: Duration(milliseconds: 500),
      popGesture: false,
    ),
    GetPage(
      name: Routes.storeSettingPage,
      page: () => StoreSettingPage(),
      binding: BindingsBuilder.put(() => StoreSettingBloc()),
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.chatPage,
      page: () => ChatPage(),
      binding: BindingsBuilder(() {
        Get.put(InputBarBloc());
        Get.put(MessageViewBloc());
        Get.put(ChatUserActionSheetBloc());
      }),
      transitionDuration: Duration(milliseconds: 500),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: Routes.profileSettingPage,
      page: () => ProfileSettingPage(),
      binding: BindingsBuilder.put(() => ProfileSettingBloc()),
      transitionDuration: Duration(milliseconds: 500),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: Routes.languageSettingPage,
      page: () => LanguageSettingPage(),
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
      binding: BindingsBuilder.put(() => SignInBloc()),
      fullscreenDialog: true,
    ),
    GetPage(
      name: Routes.blockedStoresSettingPage,
      page: () => BlockedStoreSetting(),
      binding: BindingsBuilder.put(() => BlockedStoreBloc()),
    ),
    GetPage(
      name: Routes.blockedUsersSettingPage,
      page: () => BlockedUsersSettingPage(),
      binding: BindingsBuilder.put(() => BlockedUsersSettingBloc()),
    ),
    GetPage(
      name: Routes.legalPage,
      page: () => PolicyInfoPage(),
    ),
    GetPage(
      name: Routes.upgradeSplash,
      page: () => UpgradeSplash(),
      binding: BindingsBuilder.put(() => UpgradeBloc()),
    ),
  ];
}

class Routes {
  static const startUpSplash = '/start-splash';
  static const upgradeSplash = '/upgrade-splash';
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
  static const blockedStoresSettingPage = '/blocked-stores-setting';
  static const blockedUsersSettingPage = '/blocked-users-setting';
  static const legalPage = '/legal';
}
