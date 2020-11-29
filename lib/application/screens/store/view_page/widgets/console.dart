import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/prefs_actor/store_prefs_actor_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/store_setting_button.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import 'edit_store_button.dart';

class Console extends StatelessWidget {
  final watcher = Get.find<StoreViewCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      cubit: watcher,
      builder: (_, state) {
        return state.map(
          inital: (s) => const SizedBox(),
          loading: (s) => const SizedBox(height: 100),
          failure: (s) => Icon(Icons.error),
          success: (s) => s.store.isOwner
              ? _buildConsole(context, s.store.prefs.isOpen)
              : const SizedBox(),
        );
      }
    );
  }

  Widget _buildConsole(BuildContext context, bool isOpen) {
    final actor = Get.put(StorePrefsActorCubit());
    return ReusableCard(
      title: 'Console',
      border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
      children: [
        SettingsTile.switchTile(
          title: 'Open - Close Store',
          onToggle: (val) => actor.storeOpenChange(isOpen: val),
          switchValue: isOpen,
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
