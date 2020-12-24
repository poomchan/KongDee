import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/splash/upgrade/upgrade_bloc.dart';

class UpgradeSplash extends ViewWidget<UpgradeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          onPressed: bloc.onPaymentTapped,
          child: Text('Pay!'),
        ),
      ),
    );
  }
}
