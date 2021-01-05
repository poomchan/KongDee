// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/user/i_user_repository.dart';
import 'package:fluttertaladsod/domain/user/user.dart';

class ProfileBloc extends GetxController with SimepleProgressSetter {
  final userId = Get.arguments as UniqueId;
  final AuthBloc authBloc = Get.find();
  final IUserRepository _iUserRepo = Get.find();
  bool get isOwner => userId == authBloc.user.id;

  final _user = Rx<UserDomain>();
  UserDomain get user => _user.value;

  Future<void> getUser() async {
    if (isOwner) {
      _user.value = authBloc.user;
      setLoaded();
    } else {
      setLoading();
      final fOrUser = await _iUserRepo.getUser(userId);
      fOrUser.fold(
        (f) => setFailure(f),
        (user) {
          _user.value = user;
          setLoaded();
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
