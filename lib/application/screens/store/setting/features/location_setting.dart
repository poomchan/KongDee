import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/location_form/location_form_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/prefs_actor/store_prefs_actor_cubit.dart';
import 'package:get/get.dart';

class LocationSetting extends StatelessWidget {
  const LocationSetting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final actorBloc = Get.find<StorePrefsActorCubit>();
    final formBloc = Get.put(LocationFormCubit()..initializeForm());
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
                BlocBuilder<LocationFormCubit, LocationFormState>(
                  cubit: formBloc,
                  builder: (_, s) => SizedBox(
                    width: 200,
                    child: Text(
                      s.location.address.getOrCrash(),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () => formBloc.locationRequested(),
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
              onPressed: () => actorBloc
                  .updateLocation(formBloc.state.location)
                  .then((_) => ExtendedNavigator.of(context).pop()),
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
