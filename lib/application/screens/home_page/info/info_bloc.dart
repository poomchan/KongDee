import 'dart:async';
import 'package:fluttertaladsod/application/bloc/core/simple_progress_setter.dart';
import 'package:fluttertaladsod/domain/info/i_info_repository.dart';
import 'package:fluttertaladsod/domain/info/info.dart';
import 'package:fluttertaladsod/domain/info/info_failure.dart';
import 'package:get/get.dart';

class InfoBloc extends GetxController with SimepleProgressSetter<InfoFailure> {
  final IInfoRepoSitory _iInfoRepoSitory = Get.find();

  StreamSubscription infoSub;
  List<InfoDomain> info = [];

  Future<void> watchInfo() async {
    try {
      setLoading();
      await Future.delayed(Duration(milliseconds: 1000));
      infoSub = _iInfoRepoSitory.watchInfo().listen((failureOrInfoList) {
        return failureOrInfoList.fold(
          (f) => setFailure(f),
          (infoList) {
            info = infoList;
            setLoaded();
          },
        );
      });
      setLoaded();
    } catch (err) {
      print(err);
    }
  }

  @override
  void onInit() {
    watchInfo();
    super.onInit();
  }

  @override
  void onClose() {
    infoSub?.cancel();
    info = null;
    super.onClose();
  }
}
