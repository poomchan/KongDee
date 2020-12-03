import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/range_form/range_form_cubit.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

class SellingRangePage extends StatelessWidget {
  const SellingRangePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formBloc = Get.put(RangeFormCubit()..initializeForm());
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(title: Text('Selling Range')),
        body: BlocBuilder<RangeFormCubit, RangeFormState>(
          cubit: formBloc,
          builder: (context, s) => ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: [
              SettingsTile.switchTile(
                title: 'Unlimited',
                switchValue: s.isInfinite,
                onToggle: (val) =>
                    formBloc.onInfiniteRangeChanged(isInfinite: val),
              ),
              const Divider(height: 0),
              const RangePicker(),
              RaisedButton(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0,
                ),
                color: Theme.of(context).accentColor,
                onPressed: () => formBloc.onSaved()
                  ..then((_) => ExtendedNavigator.of(context).pop()),
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
    final formBloc = Get.find<RangeFormCubit>();
    return !formBloc.state.isInfinite
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
                      initialValue:
                          formBloc.state.range.getOrCrash().toString(),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.center,
                      enableSuggestions: false,
                      enabled: !formBloc.state.isInfinite,
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
                      onChanged: (val) => formBloc.onRangeChanged(val),
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
