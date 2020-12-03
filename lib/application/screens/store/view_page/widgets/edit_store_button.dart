import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:get/get.dart';

class EditStoreButton extends StatelessWidget {
  const EditStoreButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      cubit: Get.find<StoreViewCubit>(),
      builder: (context, state) {
        return state.map(
          inital: (_) => circularProgress(context),
          loading: (_) => circularProgress(context),
          failure: (_) => Icon(Icons.error),
          success: (s) => OutlineButton(
            onPressed: () => Get.toNamed(Routes.storeForm, arguments: some(s.store)),
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Text('Edit Store Appearance'),
          ),
        );
      },
    );
  }
}
