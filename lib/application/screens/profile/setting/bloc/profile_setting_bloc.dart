// Package imports:
import 'package:fluttertaladsod/application/bloc/language/language_bloc.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/domain/user/user.dart';

class ProfileSettingBloc extends GetxController with SimepleProgressSetter{
  final AuthBloc _authBloc = Get.find();
  final LanguageBloc _languageBloc = Get.find();
  String get langName => _languageBloc.currentLangName;
  UserDomain get user => _authBloc.user;

}
