import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';

class StartUpSplash extends StatelessWidget {
  const StartUpSplash();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: circularProgress(context),
    );
  }
}
