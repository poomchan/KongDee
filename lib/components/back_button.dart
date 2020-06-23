import 'package:flutter/material.dart';
import 'package:fluttertaladsod/constant.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: kBeautifulBlackColor,
      onPressed: () => Navigator.pop(context),
    );
  }
}
