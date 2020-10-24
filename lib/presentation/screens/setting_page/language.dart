import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class LanguageSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SettingsList(
        backgroundColor: Theme.of(context).backgroundColor,
        physics: NeverScrollableScrollPhysics(),
        sections: [
          SettingsSection(
            title: 'Select Language',
            tiles: [
              SettingsTile(
                title: 'Thai',
                // leading: Icon(Icons.language),
                trailing: Container(),
                onTap: () {},
              ),
              SettingsTile(
                title: 'English',
                // leading: Icon(Icons.fingerprint),
                trailing: Icon(Icons.check),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
