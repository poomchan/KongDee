import 'dart:async';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/auth/auth_failure.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/auth/user/user.dart';
import 'package:get/get.dart';

class AuthBloc extends GetxController with SimepleProgressSetter<AuthFailure> {
  IAuthFacade get _iAuthFacade => Get.find<IAuthFacade>();

  final _user = Rx<UserDomain>();
  Rx<UserDomain> get rxUser => _user;
  UserDomain get user => _user.value;
  bool get isAuth => _user.value != null;

  StreamSubscription _userSub;

  Future<void> watchUser() async {
    updateWithLoading();
    final userOrFailureStream = _iAuthFacade.watchSignedInUser();
    _userSub = userOrFailureStream.listen((userOrFailure) {
      return userOrFailure.fold(
        (f) {
          _user.value = null;
          updateWithFailure(f);
        },
        (user) {
          _user.value = user;
          updateWithLoaded();
        },
      );
    });
  }

  Future<void> signOut() async {
    await _iAuthFacade.signOut();
    navigator.popUntil((route) => route.settings.name == Routes.homePage);
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
