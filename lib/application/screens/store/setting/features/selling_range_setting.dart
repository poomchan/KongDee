import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_bloc.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

class SellingRangePage extends StatelessWidget {
  const SellingRangePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('Selling Range')),
        body: GetBuilder<StoreSettingBloc>(
          builder: (bloc) => ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: [
              SettingsTile.switchTile(
                title: 'Unlimited',
                switchValue: bloc.sellingRange.isInFinite,
                onToggle: (val) => bloc.onInfiniteRangeChanged(isInf: val),
              ),
              const Divider(height: 0),
              const RangePicker(),
              RaisedButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                color: Theme.of(context).accentColor,
                onPressed: () => bloc.onSellingRangeSaved(),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RangePicker extends StatelessWidget {
  const RangePicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoreSettingBloc>();
    return !bloc.sellingRange.isInFinite
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.white,
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sell in'),
                  SizedBox(
                    width: 100.0,
                    child: TextFormField(
                      initialValue: bloc.sellingRange.getOrCrash().toString(),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.center,
                      enableSuggestions: false,
                      enabled: !bloc.sellingRange.isInFinite,
                      validator: (val) {
                        if (val.isEmpty) return 'cannot be empty';
                        try {
                          final n = double.parse(val);
                          if (n == 0) return 'cannot be zero';
                          if (n < 0) return 'cannot be negative';
                        } catch (e) {
                          return 'invalid value';
                        }
                        return null;
                      },
                      onChanged: (val) => bloc.onSellingRangeChanged(val),
                    ),
                  ),
                  Text('kilometers'),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
