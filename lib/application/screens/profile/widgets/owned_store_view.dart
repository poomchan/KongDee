import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/profile/bloc/store_own_watcher/owned_store_watcher_cubit.dart';
import 'package:fluttertaladsod/application/screens/profile/widgets/no_store_card.dart';
import 'package:fluttertaladsod/application/screens/store/widgets/store_card.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:get/get.dart';

class OwnedStoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnedStoreWatcherCubit, OwnedStoreWatcherState>(
      cubit: Get.put(OwnedStoreWatcherCubit())..watchOwnedStoreStarted(),
      builder: (context, state) => state.map(
          inital: (_) => null,
          loadInProgress: (_) => circularProgress(context),
          loadSuccess: (s) => _buildSuccessWidget(context, s.store),
          loadFailure: (s) => _buildErrorWidget(context, s.f)),
    );
  }

  Widget _buildSuccessWidget(BuildContext context, Store s) {
    return StoreCard(store: s);
  }

  Widget _buildErrorWidget(BuildContext context, StoreFailure f) {
    return f.map(
      noStore: (_) => NoStoreCard(),
      unexpected: (f) => Text('ERROR: unexpected failure : ${f.detail}'),
      locationNotGranted: (_) => Text('ERROR: location not granted'),
      timeout: (_) => Text('Timeout'),
    );
  }
}
