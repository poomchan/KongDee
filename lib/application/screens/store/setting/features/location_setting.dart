import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/location_form/location_form_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/prefs_actor/store_prefs_actor_cubit.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';

import '../../../../../injection.dart';

class LocationSetting extends StatefulWidget with AutoRouteWrapper {
  final BuildContext parentContext;
  final StoreLocation initLocation;

  const LocationSetting(
      {Key key, @required this.parentContext, @required this.initLocation})
      : super(key: key);

  @override
  _LocationSettingState createState() => _LocationSettingState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: BlocProvider.of<StorePrefsActorCubit>(parentContext),
        ),
        BlocProvider(
          create: (context) =>
              getIt<LocationFormCubit>()..initializeForm(initLocation),
        ),
      ],
      child: this,
    );
  }
}

class _LocationSettingState extends State<LocationSetting> {
  StoreLocation selectedLocation;

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
                  width: 200.0,
                  child: BlocBuilder<LocationFormCubit, LocationFormState>(
                    builder: (_, s) => Text(
                      s.location.address.getOrCrash(),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () =>
                      context.read<LocationFormCubit>().locationRequested(),
                  child: Text('Update'),
                )
              ],
            ),
          ),
          Divider(height: 0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () => context.read<StorePrefsActorCubit>().updateLocation(
                            context.read<LocationFormCubit>().state.location,
                          ),
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
