import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_view/store_view_cubit.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';

class EditStoreButton extends StatelessWidget {
  const EditStoreButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      builder: (context, state) {
        return state.map(
          inital: (state) => circularProgress(context),
          loading: (state) => circularProgress(context),
          failure: (state) => Icon(Icons.error),
          success: (state) => OutlineButton(
            onPressed: () => ExtendedNavigator.of(context).push(
              Routes.storeForm,
              arguments: StoreFormArguments(
                initialStore: some(state.store),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Text('Edit store'),
          ),
        );
      },
    );
  }
}
