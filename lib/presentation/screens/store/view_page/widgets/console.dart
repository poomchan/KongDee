import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/edit_store_button.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/store_setting_button.dart';
import 'package:settings_ui/settings_ui.dart';

class Console extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      title: 'Console',
      border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
      children: [
        SettingsTile.switchTile(
          title: 'Open - Close Store',
          onToggle: (val) {},
          switchValue: true,
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          overflowDirection: VerticalDirection.down,
          overflowButtonSpacing: 10.0,
          children: const [
            EditStoreButton(),
            StoreSettingButton(),
          ],
        ),
      ],
    );
  }
}
