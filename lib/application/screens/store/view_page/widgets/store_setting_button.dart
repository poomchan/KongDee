import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:get/get.dart';

class StoreSettingButton extends StatelessWidget {
  const StoreSettingButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      cubit: Get.find<StoreViewCubit>(),
      builder: (_, state) {
        return state.map(
          inital: (_) => circularProgress(context),
          loading: (_) => circularProgress(context),
          failure: (_) => Icon(Icons.error),
          success: (_) => OutlineButton(
            onPressed: () => Get.toNamed(Routes.storeSettingPage),
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
