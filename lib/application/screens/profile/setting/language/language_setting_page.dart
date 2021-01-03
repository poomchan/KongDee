// Flutter imports:
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/language/language_bloc.dart';
import 'package:get/get.dart';

// Package imports:
import 'package:settings_ui/settings_ui.dart';

class LanguageSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<LanguageBloc>(
        builder: (bloc) => SettingsList(
          backgroundColor: Theme.of(context).backgroundColor,
          physics: NeverScrollableScrollPhysics(),
          sections: [
            SettingsSection(
              title: 'Select Language',
              tiles: [
                SettingsTile(
                    title: 'Thai',
                    leading: Icon(Icons.language),
                    trailing: bloc.state.isThai
                      ? const Icon(Icons.check)
                      : const SizedBox(),
                    onTap: bloc.onThaiChanged),
                SettingsTile(
                  title: 'English',
                  leading: Icon(Icons.language),
                  trailing: bloc.state.isEnglishUS
                      ? const Icon(Icons.check)
                      : const SizedBox(),
                  onTap: bloc.onEnglishUSChanged,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
