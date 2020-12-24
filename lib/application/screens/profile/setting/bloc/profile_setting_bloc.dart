import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:get/get.dart';

class ProfileSettingBloc extends GetxController with SimepleProgressSetter{
  AuthBloc get _authBloc => Get.find();

  UserDomain get user => _authBloc.user;

}