import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/global_bloc/auth/actor/auth_actor_cubit.dart';
import 'package:fluttertaladsod/application/routes/router.gr.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SettingsList(
            backgroundColor: Theme.of(context).backgroundColor,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            sections: [
              SettingsSection(
                title: 'Section',
                tiles: [
                  SettingsTile(
                    title: 'Language',
                    subtitle: 'English',
                    leading: Icon(Icons.language),
                    onTap: () => context.navigator.pushLanguageSetting(),
                  ),
                  SettingsTile.switchTile(
                    title: 'Use fingerprint',
                    leading: Icon(Icons.fingerprint),
                    switchValue: true,
                    onToggle: (bool value) {},
                  ),
                ],
              ),
              SettingsSection(
                title: 'Policies',
                tiles: [
                  SettingsTile(
                    title: 'Privacy Policy',
                    leading: Icon(Icons.privacy_tip),
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'Terms of Use',
                    leading: Icon(Icons.policy),
                    onTap: () {},
                  ),
                  SettingsTile(
                    title: 'About the Application',
                    leading: Icon(Icons.info),
                    onTap: () => showAboutDialog(
                      context: context,
                      applicationName: 'Kong Dee',
                      applicationVersion: '0.0.1',
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () => context.read<AuthActorCubit>().signOut(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Sign Out'),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(FontAwesomeIcons.signOutAlt),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
