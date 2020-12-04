import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

class StoreSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Store Setting'),
      ),
      body: GetBuilder<StoreViewBloc>(
        builder: (watcherBloc) => watcherBloc.state.when(
          inital: () => circularProgress(context),
          loading: () => circularProgress(context),
          loaded: () => _buildSettingView(context),
          failure: () => Icon(Icons.error),
        ),
      ),
    );
  }

  ListView _buildSettingView(BuildContext context) {
    final watch = Get.find<StoreViewBloc>();
    final bloc = Get.find<StoreSettingBloc>();
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      children: [
        Obx(
          () => SettingsSection(
            title: 'General',
            tiles: [
              SettingsTile.switchTile(
                title: 'Open/Close Store',
                leading: Icon(FontAwesomeIcons.clock),
                switchValue: watch.store.prefs.isOpen,
                onToggle: (bool val) {
                  bloc.onStoreOpenToggled(isOpen: val);
                },
              ),
              SettingsTile(
                title: 'Store Location',
                subtitle: watch.store.location.address.getOrCrash(),
                leading: Icon(Icons.gps_fixed),
                onTap: () => Get.toNamed(Routes.locationSettingPage),
              ),
              SettingsTile(
                  title: 'Selling Range',
                  subtitle:
                      'with in ${watch.store.prefs.sellingRange.getOrCrash()} km',
                  leading: Icon(Icons.near_me),
                  onTap: () => Get.toNamed(Routes.sellingRangeSettingPage)),
            ],
          ),
        ),
        SettingsSection(
          title: 'Additional Settings',
          tiles: [
            SettingsTile.switchTile(
              title: 'Notifications',
              leading: Icon(Icons.notifications),
              switchValue: watch.store.prefs.isNotificationOn,
              onToggle: (val) => bloc.onStoreNotificationToggled(isOn: val),
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
