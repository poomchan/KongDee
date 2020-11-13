import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/prefs/actor/store_prefs_actor_cubit.dart';
import 'package:fluttertaladsod/application/store/store_view/store_view_cubit.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/edit_store_button.dart';
import 'package:fluttertaladsod/presentation/screens/store/view_page/widgets/store_setting_button.dart';
import 'package:settings_ui/settings_ui.dart';

class Console extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final storePrefsBloc = BlocProvider.of<StorePrefsActorCubit>(context);

    return BlocBuilder<StoreViewCubit, StoreViewState>(
      builder: (context, state) {
        return state.map(
          inital: (state) => const SizedBox(),
          loading: (state) => const SizedBox(height: 100),
          success: (state) => state.store.isOwner
              ? ReusableCard(
                  title: 'Console',
                  border: Border.all(
                      color: Theme.of(context).accentColor, width: 4.0),
                  children: [
                    SettingsTile.switchTile(
                      title: 'Open - Close Store',
                      onToggle: (val) =>
                          storePrefsBloc.storeOpenChange(context, isOpen: val),
                      switchValue: state.store.prefs.isOpen,
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
                )
              : Container(),
          failure: (state) => Icon(Icons.error),
        );
      },
    );
  }
}
