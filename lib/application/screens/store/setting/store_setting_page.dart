import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/routes/router.gr.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import 'bloc/prefs_actor/store_prefs_actor_cubit.dart';

class StoreSettingPage extends StatelessWidget {
  final watcherBloc = Get.find<StoreViewCubit>();
  final actorBloc = Get.find<StorePrefsActorCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Store Setting'),
      ),
      body: BlocBuilder<StoreViewCubit, StoreViewState>(
        cubit: watcherBloc,
        builder: (_, s) => s.map(
          inital: (_) => throw 'Bloc has not been init properly',
          loading: (_) => circularProgress(context),
          success: (s) => _buildSettingView(context, s.store),
          failure: (s) => Icon(Icons.error),
        ),
      ),
    );
  }

  ListView _buildSettingView(BuildContext context, Store store) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      children: [
        SettingsSection(
          title: 'General',
          tiles: [
            SettingsTile.switchTile(
              title: 'Open/Close Store',
              leading: Icon(FontAwesomeIcons.clock),
              switchValue: store.prefs.isOpen,
              onToggle: (bool val) {
                actorBloc.storeOpenChange(isOpen: val);
              },
            ),
            SettingsTile(
              title: 'Store Location',
              subtitle: store.location.address.getOrCrash(),
              leading: Icon(Icons.gps_fixed),
              onTap: () => context.navigator.pushLocationSetting(),
            ),
            SettingsTile(
              title: 'Selling Range',
              subtitle: 'with in ${store.prefs.sellingRange.getOrCrash()} km',
              leading: Icon(Icons.near_me),
              onTap: () => context.navigator.pushSellingRangePage(),
            ),
          ],
        ),
        SettingsSection(
          title: 'Additional Settings',
          tiles: [
            SettingsTile.switchTile(
              title: 'Notifications',
              leading: Icon(Icons.notifications),
              switchValue: store.prefs.isNotificationOn,
              onToggle: (val) => actorBloc.storeNotificationChange(isOn: val),
            ),
            SettingsTile(
              title: 'Blocked Users',
              leading: Icon(Icons.block),
              onTap: () => showAboutDialog(
                context: context,
                applicationName: 'Kong Dee',
                applicationVersion: '0.0.1',
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: RaisedButton(
            color: Theme.of(context).errorColor,
            onPressed: () => print('deleting store'),
            child: Text(
              'Delete Store',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onError,
              ),
            ),
          ),
        )
      ],
    );
  }
}
