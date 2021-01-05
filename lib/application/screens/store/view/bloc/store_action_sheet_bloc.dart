// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/application/core/haptic_feedback.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view/widgets/dialogs.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/report/i_report_repository.dart';
import 'package:fluttertaladsod/domain/report/report.dart';
import 'package:fluttertaladsod/domain/report/report_failure.dart';
import 'package:fluttertaladsod/domain/user/i_user_repository.dart';
import 'package:fluttertaladsod/domain/user/user.dart';

class StoreActionSheetBloc extends GetxController
    with SimepleProgressSetter<ReportFailure> {
  IUserRepository get _iUserRepo => Get.find();
  IReportRepository get _iReportRepo => Get.find();
  AuthBloc get _authBloc => Get.find();
  StoreViewBloc get _storeBloc => Get.find();

  String get storeName => _storeBloc.store.name.getOrCrash();
  bool get isStoreOwner => _storeBloc.isStoreOwner;
  bool get isBlocked {
    final id = _storeBloc.store.id.getOrCrash();
    final map = _authBloc.user.blockedStores;
    return map[id] == true;
  }

  UniqueId get _storeId => _storeBloc.store.id;
  String reportReason = '';

  UserDomain get _user => _authBloc.user;

  void onMoreTapped() {
    showCupertinoModalPopup(
      context: Get.context,
      builder: (_) => buildStoreActionSheet(),
    );
    HapticFeedback.mediumImpact();
  }

  Future<void> onBlockStoreTapped({@required bool block}) async {
    setLoading();
    Get.back();
    Get.dialog(
      buildBlockStoreDialog(),
      barrierDismissible: false,
    );
    if (_user == null) throw 'user is null';
    final fOrUnit = await _iUserRepo.updateUser(
      _user.copyWith(
        blockedStores: _user.blockedStores
          ..addEntries(
            [MapEntry(_storeBloc.store.id.getOrCrash(), block)],
          ),
      ),
    );
    fOrUnit.fold(
      (f) => setFailure(ReportFailure.unexpected(f)),
      (unit) {
        setLoaded();
        Get.back();
        doubleHapticFeedback();
      },
    );
  }

  void onReportStoreTapped() {
    Get.back();
    Get.dialog(
      buildReportStoreDialog(),
      barrierDismissible: false,
    );
  }

  Future<void> onReportSubmitTapped() async {
    setLoading();
    final fOrUnit = await _iReportRepo.sendReport(
      Report.store(
        reporter: _user.id,
        storeId: _storeId,
        description: reportReason,
      ),
    );
    fOrUnit.fold(
      (f) => setFailure(f),
      (unit) async {
        setLoaded();
        await doubleHapticFeedback();
        Get.back();
      },
    );
  }

  @override
  void onReady() {
    setLoaded();
    super.onReady();
  }
}
