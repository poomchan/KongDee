import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store/prefs/actor/store_prefs_actor_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/widgets/store_setting_button.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:settings_ui/settings_ui.dart';

import 'edit_store_button.dart';

class Console extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      builder: (context, state) {
        return state.map(
          inital: (state) => const SizedBox(),
          loading: (state) => const SizedBox(height: 100),
          failure: (state) => Icon(Icons.error),
          success: (state) => state.store.isOwner
              ? BlocProvider<StorePrefsActorCubit>(
                  create: (contxt) =>
                      getIt<StorePrefsActorCubit>()..initializeBloc(contxt),
                  child: ConsoleWidget(isOpen: state.store.prefs.isOpen),
                )
              : Container(),
        );
      },
    );
  }
}

class ConsoleWidget extends StatelessWidget {
  final bool isOpen;

  const ConsoleWidget({Key key, @required this.isOpen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final storePrefsBloc = BlocProvider.of<StorePrefsActorCubit>(context);

    return ReusableCard(
      title: 'Console',
      border: Border.all(color: Theme.of(context).accentColor, width: 4.0),
      children: [
        SettingsTile.switchTile(
          title: 'Open - Close Store',
          onToggle: (val) => storePrefsBloc.storeOpenChange(isOpen: val),
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
