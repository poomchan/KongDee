// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_view_bloc.dart';

class MenuView extends StatelessWidget {
  const MenuView();
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      title: 'Menu',
      children: [
        GetX<StoreViewBloc>(
          builder: (bloc) {
            return bloc.progress.when(
                inital: () => circularProgress(context),
                loading: () => circularProgress(context),
                loaded: () => Text(bloc.store.menu.getOrCrash()),
                failure: () => Icon(Icons.error));
          }
        )
      ],
    );
  }
}
