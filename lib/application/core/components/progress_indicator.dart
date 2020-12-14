import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget circularProgress([BuildContext context]) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 10.0),
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Theme.of(Get.context).accentColor),
    ),
  );
}

Widget linearProgress([BuildContext context]) {
  return Container(
    padding: const EdgeInsets.only(
      bottom: 10.0,
    ),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Theme.of(Get.context).accentColor),
    ),
  );
}