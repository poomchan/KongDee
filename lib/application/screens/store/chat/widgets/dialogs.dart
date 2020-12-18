import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/action/chat_user_action_sheet_bloc.dart';
import 'package:get/get.dart';

Widget buildAvatarActionSheet() {
  return GetBuilder<ChatUserActionSheetBloc>(
    builder: (bloc) {
      final name = bloc.user.name;
      return bloc.progress.when(
        inital: () => throw 'bloc has not init properly',
        loading: () => circularProgress(),
        loaded: () => CupertinoActionSheet(
          actions: [
            if (bloc.isStoreOwner)
              CupertinoActionSheetAction(
                onPressed: () => bloc.onBlockUserTapped(block: !bloc.isBlocked),
                isDestructiveAction: true,
                child: Text("${bloc.isBlocked ? 'Unblock' : 'Block'} user '$name'")
              ),
            CupertinoActionSheetAction(
              onPressed: bloc.onReportUserTapped,
              isDestructiveAction: true,
              child: Text("Report user '$name'"),
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

Widget buildReportDialog() {
  return GetBuilder<ChatUserActionSheetBloc>(
    builder: (bloc) => AlertDialog(
      title: Text('Why do you want to report?'),
      content: TextField(
        maxLines: 5,
        decoration: InputDecoration(hintText: 'The reason...'),
        onChanged: (val) => bloc.reportReason = val,
      ),
      actions: bloc.progress.maybeWhen(
        loaded: () => [
          TextButton(onPressed: Get.back, child: Text('Cancel')),
          TextButton(
            onPressed: () => bloc.onReportSubmitTapped(),
            child: Text('Submit'),
          )
        ],
        loading: () => [circularProgress(), const SizedBox(width: 50.0)],
        orElse: () => [],
      ),
    ),
  );
}

Widget buildBlockingDialog() {
  return GetBuilder<ChatUserActionSheetBloc>(
    builder: (bloc) => bloc.progress.when(
      inital: () => throw 'bloc has not init properly',
      loading: () => circularProgress(),
      loaded: () => const SizedBox(),
      failure: () => buildErrorDialog(),
    ),
  );
}

Widget buildErrorDialog() {
  return GetBuilder<ChatUserActionSheetBloc>(
    builder: (bloc) => AlertDialog(
      title: Text('We are sorry =('),
      content: Text(
          'The operation is not success. Please try again later. \n Error: ${bloc.failure}'),
      actions: [TextButton(onPressed: Get.back, child: Text('Ok'))],
    ),
  );
}
