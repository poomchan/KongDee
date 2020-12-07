import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:get/get.dart';

class StoreSettingButton extends StatelessWidget {
  const StoreSettingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => Get.toNamed(Routes.storeSettingPage),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Text('Store Setting'),
    );
  }
}
