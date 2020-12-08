import 'dart:async';

import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/action_state.dart';
import 'package:fluttertaladsod/domain/auth/auth_failure.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:get/get.dart';

class SignInBloc extends GetxController with SimpleStateSetter<AuthFailure> {
  IAuthFacade get _iAuthFacade => Get.find<IAuthFacade>();
  AuthBloc get _authBloc => Get.find<AuthBloc>();
  StreamSubscription userStream;

  Future<void> signInWithGoogle() async {
    setLoadingState();
    final success = await _iAuthFacade.signInWithGoogle();
    if (!success) {
      setLoadedState();
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
