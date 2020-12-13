import 'package:flutter/cupertino.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:get/get.dart';

CupertinoActionSheet buildAvatarActionSheet(String name) {
  final storeBloc = Get.find<StoreViewBloc>();
  return CupertinoActionSheet(
    actions: [
      if (storeBloc.isStoreOwner)
        CupertinoActionSheetAction(
          onPressed: () => print("Block user '$name'"),
          isDestructiveAction: true,
          child: Text("Block user '$name'"),
        ),
      CupertinoActionSheetAction(
        onPressed: () => print("Report user '$name'"),
        isDestructiveAction: true,
        child: Text("Report user '$name'"),
      ),
    ],
    cancelButton: CupertinoActionSheetAction(
      onPressed: () => Get.back(),
      child: Text('Cancel'),
    ),
  );
}
