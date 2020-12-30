// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
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
