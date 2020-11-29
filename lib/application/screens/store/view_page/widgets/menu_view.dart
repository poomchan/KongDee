import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:get/get.dart';

class MenuView extends StatelessWidget {
  final watcher = Get.find<StoreViewCubit>();
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      title: 'Menu',
      children: [
        BlocBuilder<StoreViewCubit, StoreViewState>(
          cubit: watcher,
          builder: (_, state) {
            return state.map(
                inital: (state) => circularProgress(context),
                loading: (state) => circularProgress(context),
                success: (state) => Text(state.store.menu.getOrCrash()),
                failure: (state) => Icon(Icons.error));
          }
        )
      ],
    );
  }
}
