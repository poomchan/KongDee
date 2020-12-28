import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/store_setting_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_view_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view/widgets/store_setting_button.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'edit_store_button.dart';

class Console extends ViewWidget<StoreViewBloc> {
  const Console();

  StoreSettingBloc get settingBloc => Get.find<StoreSettingBloc>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreViewBloc>(builder: (bloc) {
      return bloc.progress.when(
        inital: () => const SizedBox(),
        loading: () => const SizedBox(height: 100),
        failure: () => Icon(Icons.error),
        loaded: () =>
            bloc.store.isOwner ? _buildRxConsole(context) : const SizedBox(),
      );
    });
  }

  Widget _buildRxConsole(BuildContext context) {
    return ReusableCard(
      title: 'Console',
      border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
      children: [
        Obx(
          () => SettingsTile.switchTile(
            title: 'Open - Close Store',
            onToggle: (val) => settingBloc.onStoreOpenToggled(isOpen: val),
            switchValue: bloc.store.prefs.isOpen,
          ),
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
