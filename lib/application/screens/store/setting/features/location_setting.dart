// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_bloc.dart';

class LocationSetting extends ViewWidget<StoreSettingBloc> {
  const LocationSetting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location Setting')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 200,
                  child: GetBuilder<StoreSettingBloc>(
                    builder: (bloc) => Text(
                      bloc.location.address.getOrCrash(),
                      overflow: TextOverflow.clip,
                    ),
                    dispose: (s) => bloc.resetState(),
                  ),
                ),
                RaisedButton(
                  onPressed: bloc.onLocationUpdated,
                  child: Text('Update'),
                )
              ],
            ),
          ),
          const Divider(height: 0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: bloc.onLocationSaved,
              child: Text(
                'Save',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
