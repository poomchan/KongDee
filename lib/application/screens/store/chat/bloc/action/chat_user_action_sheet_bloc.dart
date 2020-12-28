import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/core/haptic_feedback.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/action/chat_user.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/dialogs.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/domain/chat/chat_failure.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/report/i_report_repository.dart';
import 'package:fluttertaladsod/domain/report/report.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:get/get.dart';

class ChatUserActionSheetBloc extends GetxController
    with SimepleProgressSetter<dynamic> {
  IReportRepository get _iReportRepository => Get.find();
  IStoreRepository get _iStoreRepository => Get.find();
  StoreViewBloc get _storeViewBloc => Get.find();
  AuthBloc get _authBloc => Get.find();

  bool get isStoreOwner => _storeViewBloc.isStoreOwner;
  ChatUser user;
  String reportReason = '';

  bool get isBlocked {
    final map = _storeViewBloc.store.blockedUsers;
    return map[user.id] == true;
  }

  void onMessageAvatarTapped(String name, String userId) {
    updateWithLoaded();
    HapticFeedback.mediumImpact();
    user = ChatUser(name: name, id: userId);
    showCupertinoModalPopup(
      context: Get.context,
      builder: (_) => buildAvatarActionSheet(),
    );
  }

  Future<void> onBlockUserTapped({@required bool block}) async {
    Get.back();
    updateWithLoading();
    Get.dialog(
      buildBlockingDialog(),
      barrierDismissible: false,
    );
    final fOrUnit = await _blockUser(block);
    fOrUnit.fold(
      (f) => updateWithFailure(ChatFailure.unexpected(f)),
      (unit) async {
        Get.back();
        await doubleHapticFeedback();
      },
    );
  }

  Future<Either<StoreFailure, Unit>> _blockUser(bool block) async {
    final store = _storeViewBloc.store;
    return _iStoreRepository.update(
      store.copyWith(
        blockedUsers: store.blockedUsers
          ..addEntries(
            [MapEntry(user.id, block)],
          ),
      ),
    );
  }

  void onReportUserTapped() {
    Get.back();
    Get.dialog(
      buildReportDialog(),
      barrierDismissible: false,
    );
  }

  Future<void> onReportSubmitTapped() async {
    updateWithLoading();
    final user = _authBloc.user;
    final fOrUnit = await _iReportRepository.sendReport(
      Report.user(
        reporter: user.id,
        userId: UniqueId.fromUniqueString(this.user.id),
        description: reportReason,
      ),
    );
    fOrUnit.fold(
      (f) => updateWithFailure(f),
      (unit) async {
        updateWithLoaded();
        await doubleHapticFeedback();
        Get.back();
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
