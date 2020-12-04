import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_bloc.dart';
import 'package:get/get.dart';

class LocationSetting extends StatelessWidget {
  const LocationSetting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoreSettingBloc>();
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
                      bloc.location.address.toString(),
                      overflow: TextOverflow.clip,
                    ),
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
