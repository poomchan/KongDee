import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/routes/router.gr.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:settings_ui/settings_ui.dart';

class StoreSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Store Setting'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          SettingsSection(
            title: 'General',
            tiles: [
              SettingsTile.switchTile(
                title: 'Open/Close Store',
                leading: Icon(FontAwesomeIcons.clock),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile(
                title: 'Store Location',
                subtitle: 'Phrakasa...',
                leading: Icon(Icons.gps_fixed),
                onTap: () => context.navigator.pushLocationSetting(),
              ),
              SettingsTile(
                title: 'Selling Range',
                subtitle: 'with in 1 km',
                leading: Icon(Icons.near_me),
                onTap: () => context.navigator.pushSellingRange(),
              ),
            ],
          ),
          SettingsSection(
            title: 'Additional Settings',
            tiles: [
              SettingsTile(
                title: 'Notifications',
                leading: Icon(Icons.notifications),
                onTap: () {},
              ),
              SettingsTile(
                title: 'Store Chat',
                leading: Icon(Icons.chat),
                onTap: () {},
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
              SettingsTile(
                title: 'Temporary Hide Store',
                leading: Icon(Icons.public_off),
                onTap: () => null,
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
      ),
    );
  }
}
