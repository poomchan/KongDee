// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/auth/user.dart';
import '../../domain/core/value_objects.dart';
import '../../domain/store/store.dart';
import '../screens/onboarding/app_onboarding_page.dart';
import '../screens/home_page/home_page.dart';
import '../screens/profile/profile_page.dart';
import '../screens/setting_page/language.dart';
import '../screens/setting_page/profile_setting.dart';
import '../screens/splash/sign_in_splash.dart';
import '../screens/store/chat/chat_page.dart';
import '../screens/store/form/store_form.dart';
import '../screens/store/setting/store_setting_page.dart';
import '../screens/store/view_page/store_view_page2.dart';

class Routes {
  static const String homePage = '/home';
  static const String appOnboardingPage = '/';
  static const String signInSplash = '/sign-in';
  static const String profilePage = '/profile';
  static const String storeForm = '/store-form';
  static const String chatPage = '/chat';
  static const String profileSettingPage = '/profile-setting-page';
  static const String languageSetting = '/language-setting';
  static const String storeViewPage2 = '/store-view-page2';
  static const String storeSettingPage = '/store-setting-page';
  static const all = <String>{
    homePage,
    appOnboardingPage,
    signInSplash,
    profilePage,
    storeForm,
    chatPage,
    profileSettingPage,
    languageSetting,
    storeViewPage2,
    storeSettingPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.appOnboardingPage, page: AppOnboardingPage),
    RouteDef(Routes.signInSplash, page: SignInSplash),
    RouteDef(Routes.profilePage, page: ProfilePage),
    RouteDef(Routes.storeForm, page: StoreForm),
    RouteDef(Routes.chatPage, page: ChatPage),
    RouteDef(Routes.profileSettingPage, page: ProfileSettingPage),
    RouteDef(Routes.languageSetting, page: LanguageSetting),
    RouteDef(Routes.storeViewPage2, page: StoreViewPage2),
    RouteDef(Routes.storeSettingPage, page: StoreSettingPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    AppOnboardingPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => AppOnboardingPage(),
        settings: data,
      );
    },
    SignInSplash: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SignInSplash(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    ProfilePage: (data) {
      final args = data.getArgs<ProfilePageArguments>(nullOk: false);
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ProfilePage(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    StoreForm: (data) {
      final args = data.getArgs<StoreFormArguments>(
        orElse: () => StoreFormArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => StoreForm(
          key: args.key,
          initialStore: args.initialStore,
        ),
        settings: data,
      );
    },
    ChatPage: (data) {
      final args = data.getArgs<ChatPageArguments>(
        orElse: () => ChatPageArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ChatPage(
          key: args.key,
          storeId: args.storeId,
        ),
        settings: data,
      );
    },
    ProfileSettingPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ProfileSettingPage(),
        settings: data,
      );
    },
    LanguageSetting: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => LanguageSetting(),
        settings: data,
      );
    },
    StoreViewPage2: (data) {
      final args = data.getArgs<StoreViewPage2Arguments>(
        orElse: () => StoreViewPage2Arguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => StoreViewPage2(
          key: args.key,
          storeId: args.storeId,
        ),
        settings: data,
      );
    },
    StoreSettingPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => StoreSettingPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushHomePage() => push<dynamic>(Routes.homePage);

  Future<dynamic> pushAppOnboardingPage() =>
      push<dynamic>(Routes.appOnboardingPage);

  Future<dynamic> pushSignInSplash() => push<dynamic>(Routes.signInSplash);

  Future<dynamic> pushProfilePage({
    Key key,
    @required UserDomain user,
  }) =>
      push<dynamic>(
        Routes.profilePage,
        arguments: ProfilePageArguments(key: key, user: user),
      );

  Future<dynamic> pushStoreForm({
    Key key,
    Option<Store> initialStore,
  }) =>
      push<dynamic>(
        Routes.storeForm,
        arguments: StoreFormArguments(key: key, initialStore: initialStore),
      );

  Future<dynamic> pushChatPage({
    Key key,
    UniqueId storeId,
  }) =>
      push<dynamic>(
        Routes.chatPage,
        arguments: ChatPageArguments(key: key, storeId: storeId),
      );

  Future<dynamic> pushProfileSettingPage() =>
      push<dynamic>(Routes.profileSettingPage);

  Future<dynamic> pushLanguageSetting() =>
      push<dynamic>(Routes.languageSetting);

  Future<dynamic> pushStoreViewPage2({
    Key key,
    UniqueId storeId,
  }) =>
      push<dynamic>(
        Routes.storeViewPage2,
        arguments: StoreViewPage2Arguments(key: key, storeId: storeId),
      );

  Future<dynamic> pushStoreSettingPage() =>
      push<dynamic>(Routes.storeSettingPage);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ProfilePage arguments holder class
class ProfilePageArguments {
  final Key key;
  final UserDomain user;
  ProfilePageArguments({this.key, @required this.user});
}

/// StoreForm arguments holder class
class StoreFormArguments {
  final Key key;
  final Option<Store> initialStore;
  StoreFormArguments({this.key, this.initialStore});
}

/// ChatPage arguments holder class
class ChatPageArguments {
  final Key key;
  final UniqueId storeId;
  ChatPageArguments({this.key, this.storeId});
}

/// StoreViewPage2 arguments holder class
class StoreViewPage2Arguments {
  final Key key;
  final UniqueId storeId;
  StoreViewPage2Arguments({this.key, this.storeId});
}
