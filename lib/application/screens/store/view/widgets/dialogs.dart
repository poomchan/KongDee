// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_action_sheet_bloc.dart';

Widget buildStoreActionSheet() {
  return GetBuilder<StoreActionSheetBloc>(
    builder: (bloc) {
      final storeName = bloc.storeName;
      return bloc.progress.when(
        inital: () => const SizedBox(),
        loading: () => circularProgress(),
        loaded: () => CupertinoActionSheet(
          actions: [
            if (bloc.isStoreOwner)
              CupertinoActionSheetAction(
                onPressed: () => bloc.onBlockStoreTapped(block: !bloc.isBlocked),
                isDestructiveAction: true,
                child: Text("${bloc.isBlocked ? 'Unblock' : 'Block'} store '$storeName'")
              ),
            CupertinoActionSheetAction(
              onPressed: bloc.onReportStoreTapped,
              isDestructiveAction: true,
              child: Text("Report store '$storeName'"),
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

Widget buildReportStoreDialog() {
  return GetBuilder<StoreActionSheetBloc>(
    builder: (bloc) => bloc.progress.maybeWhen(
      inital: () => const SizedBox(),
      failure: () => buildErrorDialog(),
      orElse: () => AlertDialog(
        title: Text('Why do you want to report: ${bloc.storeName}?'),
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
    ),
  );
}

Widget buildBlockStoreDialog() {
  return GetBuilder<StoreActionSheetBloc>(
    builder: (bloc) => bloc.progress.when(
      inital: () => const SizedBox(),
      loading: () => circularProgress(),
      loaded: () => const SizedBox(),
      failure: () => buildErrorDialog(),
    ),
  );
}

Widget buildErrorDialog() {
  return GetBuilder<StoreActionSheetBloc>(
    builder: (bloc) => AlertDialog(
      title: Text('We are sorry =('),
      content: Text(
          'The operation is not success. Please try again later. \n Error: ${bloc.failure}'),
      actions: [TextButton(onPressed: Get.back, child: Text('Ok'))],
    ),
  );
}
