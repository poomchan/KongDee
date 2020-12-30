// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/blocked_users_bloc.dart';

Widget buildAvatarActionSheet() {
  return GetBuilder<BlockedUsersSettingBloc>(
    builder: (bloc) {
      final name = bloc.userOnFocus.displayName;
      return bloc.progress.when(
        inital: () => throw 'bloc has not init properly',
        loading: () => circularProgress(),
        loaded: () => CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => bloc.onBlockUserTapped(),
              isDestructiveAction: true,
              child:
                  Text("${bloc.isBlocked ? 'Unblock' : 'Block'} user '$name'"),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
        ),
        failure: () => buildErrorDialog(),
      );
    },
  );
}


Widget buildErrorDialog() {
  return GetBuilder<BlockedUsersSettingBloc>(
    builder: (bloc) => AlertDialog(
      title: Text('We are sorry =('),
      content: Text(
          'The operation is not success. Please try again later. \n Error: ${bloc.failure}'),
      actions: [TextButton(onPressed: Get.back, child: Text('Ok'))],
    ),
  );
}

Widget buildBlockingDialog() {
  return GetBuilder<BlockedUsersSettingBloc>(
    builder: (bloc) => bloc.progress.when(
      inital: () => throw 'bloc has not init properly',
      loading: () => circularProgress(),
      loaded: () => const SizedBox(),
      failure: () => buildErrorDialog(),
    ),
  );
}
