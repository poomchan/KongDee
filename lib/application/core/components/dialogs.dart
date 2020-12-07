import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'progress_indicator.dart';

AwesomeDialog savingDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    body: Column(
      children: [
        circularProgress(context),
        Text(
          'saving',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        ),
      ],
    ),
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: false,
  );
}

AwesomeDialog successDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.SUCCES,
    title: '',
    desc: '',
    autoHide: Duration(milliseconds: 2000),
  );
}

AwesomeDialog errorDialog(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.ERROR,
    title: '',
    desc: '',
    autoHide: Duration(milliseconds: 2000),
  );
}
