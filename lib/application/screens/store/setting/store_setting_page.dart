import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

class StoreSettingPage extends ViewWidget<StoreSettingBloc> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Store Setting'),
      ),
      body: GetBuilder<StoreViewBloc>(
        builder: (watcher) => watcher.progress.when(
          inital: () => const SizedBox(),
          loading: () => circularProgress(context),
          loaded: () => _buildSettingView(context),
          failure: () => const Icon(Icons.error),
        ),
      ),
    );
  }

  ListView _buildSettingView(BuildContext context) {
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
                switchValue: bloc.store.prefs.isOpen,
                onToggle: (bool val) {
                  bloc.onStoreOpenToggled(isOpen: val);
                },
              ),
              SettingsTile(
                title: 'Store Location',
                subtitle: bloc.store.location.address.getOrCrash(),
                leading: Icon(Icons.gps_fixed),
                onTap: () => Get.toNamed(Routes.locationSettingPage),
              ),
              SettingsTile(
                  title: 'Selling Range',
                  subtitle:
                      'with in ${bloc.store.prefs.sellingRange.getOrCrash()} km',
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
              switchValue: bloc.store.prefs.isNotificationOn,
              onToggle: (val) => bloc.onStoreNotificationToggled(isOn: val),
            ),
            SettingsTile(
              title: 'Blocked Users',
              leading: Icon(Icons.block),
              onTap: () => Get.toNamed(Routes.blockedUsersSettingPage),
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
