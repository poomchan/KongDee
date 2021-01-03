// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/domain/user/user.dart';

class ProfileSettingBloc extends GetxController with SimepleProgressSetter{
  final AuthBloc _authBloc = Get.find();

  UserDomain get user => _authBloc.user;

}
