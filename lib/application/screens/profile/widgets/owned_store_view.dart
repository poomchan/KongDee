import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/profile/bloc/owened_store/owned_store_watcher_cubit.dart';
import 'package:fluttertaladsod/application/screens/profile/widgets/no_store_card.dart';
import 'package:fluttertaladsod/application/screens/store/widgets/store_card.dart';
import 'package:get/get.dart';

class OwnedStoreView extends StatelessWidget {
  const OwnedStoreView();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnedStoreBloc>(
      builder: (bloc) => bloc.state.when(
        inital: () => circularProgress(context),
        loading: () => circularProgress(context),
        loaded: () => _buildSuccessWidget(context),
        failure: () => _buildErrorWidget(context),
      ),
    );
  }

  Widget _buildSuccessWidget(BuildContext context) {
    final bloc = Get.find<OwnedStoreBloc>();
    return Obx(() => StoreCard(store: bloc.store));
  }

  Widget _buildErrorWidget(BuildContext context) {
    final bloc = Get.find<OwnedStoreBloc>();
    return bloc.failure.when(
      noStore: () => NoStoreCard(),
      unexpected: (err) => Text('ERROR: unexpected failure : ${err.detail}'),
      locationNotGranted: () => Text('ERROR: location not granted'),
      timeout: () => Text('Timeout'),
    );
  }
}
