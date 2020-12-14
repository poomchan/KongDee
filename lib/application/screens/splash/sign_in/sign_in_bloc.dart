import 'dart:async';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/domain/auth/auth_failure.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:get/get.dart';

class SignInBloc extends GetxController with SimepleProgressSetter<AuthFailure> {
  IAuthFacade get _iAuthFacade => Get.find();
  AuthBloc get _authBloc => Get.find();
  StreamSubscription userStream;

  Future<void> signInWithGoogle() async {
    updateWithLoading();
    final success = await _iAuthFacade.signInWithGoogle();
    if (!success) {
      updateWithLoaded();
    }
  }

  @override
  void onReady() {
    super.onReady();
    userStream = _authBloc.rxUser.listen((u) {
      if (u != null) Get.back();
    });
  }

  @override
  void onClose() {
    userStream.cancel();
    super.onClose();
  }
}
