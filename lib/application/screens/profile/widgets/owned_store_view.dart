import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/profile/bloc/owned_store_bloc.dart';
import 'package:fluttertaladsod/application/screens/profile/widgets/no_store_card.dart';
import 'package:fluttertaladsod/application/screens/store/widgets/store_card.dart';
import 'package:get/get.dart';

class OwnedStoreView extends ViewWidget<OwnedStoreBloc> {
  const OwnedStoreView();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnedStoreBloc>(
      builder: (bloc) => bloc.state.when(
        inital: () => const SizedBox(),
        loading: () => circularProgress(context),
        loaded: () => _buildSuccessWidget(context),
        failure: () => _buildErrorWidget(context),
      ),
    );
  }

  Widget _buildSuccessWidget(BuildContext context) {
    return Obx(() => StoreCard(store: bloc.store));
  }

  Widget _buildErrorWidget(BuildContext context) {
    return bloc.failure.when(
      noStore: () => NoStoreCard(),
      unexpected: (f) => Text('ERROR: unexpected failure : ${f.detail}'),
      locationNotGranted: () => Text('ERROR: location not granted'),
      timeout: () => Text('Timeout'),
    );
  }
}
