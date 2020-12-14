import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/domain/auth/user/user.dart';
import 'package:fluttertaladsod/domain/auth/user/i_user_repository.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:get/get.dart';

class ProfileBloc extends GetxController with SimepleProgressSetter {
  final userId = Get.arguments as UniqueId;

  AuthBloc get authBloc => Get.find();
  IUserRepository get _iUserRepo => Get.find();
  bool get isOwner => userId == authBloc.user.id;

  final _user = Rx<UserDomain>();
  UserDomain get user => _user.value;

  Future<void> getUser() async {
    if (isOwner) {
      _user.value = authBloc.user;
      updateWithLoaded();
    } else {
      updateWithLoading();
      final fOrUser = await _iUserRepo.getUser(userId);
      fOrUser.fold(
        (f) => updateWithFailure(f),
        (user) {
          _user.value = user;
          updateWithLoaded();
        },
      );
    }
  }

  void showDiaglog() {
    Get.showSnackbar(GetBar(
      message: 'Hello!',
      duration: Duration(milliseconds: 1500),
    ));
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getUser();
  }

  @override
  void onClose() {
    _user.close();
    super.onClose();
  }
}
