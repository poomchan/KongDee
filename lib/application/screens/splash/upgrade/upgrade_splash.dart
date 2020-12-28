import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/splash/upgrade/upgrade_bloc.dart';

class UpgradeSplash extends ViewWidget<UpgradeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('upgrade now')),
      body: Center(
        child: TextButton(
          onPressed: bloc.onPaymentTapped,
          child: Text('Pay!!'),
        ),
      ),
    );
  }
}
