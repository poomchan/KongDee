// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_view_bloc.dart';

class NameView extends StatelessWidget {
  const NameView();

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      children: [
        GetBuilder<StoreViewBloc>(builder: (bloc) {
          return bloc.progress.when(
            inital: () => circularProgress(context),
            loading: () => circularProgress(context),
            loaded: () => _buildRxNameField(context),
            failure: () => _buildFailureWidget(),
          );
        })
      ],
    );
  }

  Widget _buildRxNameField(BuildContext context) {
    return GetX<StoreViewBloc>(
      builder: (bloc) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bloc.store.name.getOrCrash(),
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            bloc.store.location.address.getOrCrash(),
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87,
              fontWeight: FontWeight.w300,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildFailureWidget() {
    return GetBuilder(
      builder: (bloc) => Center(
        child: Icon(Icons.error),
      ),
    );
  }
}
