import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/prefs_actor/store_prefs_actor_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/range_form/range_form_cubit.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../../injection.dart';

class SellingRangePage extends StatelessWidget with AutoRouteWrapper {
  final BuildContext parentContext;
  final SellingRange initSellingRange;

  const SellingRangePage(
      {Key key, @required this.parentContext, @required this.initSellingRange})
      : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<RangeFormCubit>()..initializeForm(initSellingRange),
        ),
        BlocProvider.value(
          value: BlocProvider.of<StorePrefsActorCubit>(parentContext),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = BlocProvider.of<RangeFormCubit>(context);
    final actorBloc = BlocProvider.of<StorePrefsActorCubit>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(title: Text('Selling Range')),
        body: BlocBuilder<RangeFormCubit, RangeFormState>(
          builder: (context, s) => ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: [
              SettingsTile.switchTile(
                title: 'Unlimited',
                switchValue: s.isInfinite,
                onToggle: (val) =>
                    formBloc.onInfiniteRangeChanged(isInfinite: val),
              ),
              Divider(
                height: 0,
              ),
              RangePicker(
                  enable: !s.isInfinite,
                  initValue: s.range.getOrCrash().toString()),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () => s.isValid
                      ? actorBloc
                          .updateSellingRange(
                            s.isInfinite ? SellingRange.infinite() : s.range,
                          )
                          .then(
                            (_) => ExtendedNavigator.of(context).pop(),
                          )
                      : null,
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
        ),
      ),
    );
  }
}

class RangePicker extends StatelessWidget {
  final bool enable;
  final String initValue;

  const RangePicker({Key key, @required this.enable, @required this.initValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formBloc = BlocProvider.of<RangeFormCubit>(context);
    return enable
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
                      initialValue: initValue,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.center,
                      enableSuggestions: false,
                      enabled: enable,
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
