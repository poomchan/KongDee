import 'dart:async';
import 'package:fluttertaladsod/application/bloc/core/action_state.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/auth/auth_failure.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:get/get.dart';

class AuthBloc extends GetxController with SimpleStateSetter<AuthFailure> {
  final _iAuthFacade = Get.find<IAuthFacade>();

  final _user = Rx<UserDomain>();
  UserDomain get user => _user.value;
  bool get isAuth => _user.value != null;

  StreamSubscription _userSub;

  Future<void> watchUser() async {
    setLoadingState();
    final userOrFailureStream = _iAuthFacade.watchSignedInUser();
    _userSub = userOrFailureStream.listen((userOrFailure) {
      return userOrFailure.fold(
        (f) => setFailureState(f),
        (user) {
          _user.value = user;
          setLoadedState();
        },
      );
    });
  }

  Future<void> signInWithGoogle() async {
    setLoadingState();
    await _iAuthFacade.signInWithGoogle();
    setLoadedState();
  }

  Future<void> signOut() async {
    setLoadingState();
    await _iAuthFacade.signOut();
    setLoadedState();
    await Get.offAllNamed(Routes.homePage);
  }

  @override
  Future<void> onReady() async {
    await watchUser();
    super.onReady();
  }

  @override
  void onClose() {
    _userSub.cancel();
    _user.close();
    super.onClose();
  }
}
