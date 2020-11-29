import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/routes/router.gr.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:get/get.dart';

class StoreSettingButton extends StatelessWidget {
  const StoreSettingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      cubit: Get.find<StoreViewCubit>(),
      builder: (context, s) {
        return s.map(
          inital: (_) => circularProgress(context),
          loading: (_) => circularProgress(context),
          failure: (_) => Icon(Icons.error),
          success: (_) => OutlineButton(
            onPressed: () => ExtendedNavigator.of(ctx).pushStoreSettingPage(parentContext: ctx),
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Text('Store Setting'),
          ),
        );
      },
    );
  }
}
