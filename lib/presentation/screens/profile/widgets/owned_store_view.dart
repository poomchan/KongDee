import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_own_watcher/cubit/owned_store_watcher_cubit.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/profile/widgets/no_store_card.dart';
import 'package:fluttertaladsod/presentation/screens/home_page/widgets/store_card.dart';

class OwnedStoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnedStoreWatcherCubit, OwnedStoreWatcherState>(
      builder: (context, state) => state.map(
        inital: (_) => null,
        loadInProgress: (state) => circularProgress(context),
        loadSuccess: (state) => StoreCard(
          store: state.store,
        ),
        loadFailure: (state) => state.f.map(
          noStore: (_) => NoStoreCard(),
          unexpected: (_) => Text('ERROR: unexpected failure'),
          locationNotGranted: (_) => Text('ERROR: location not granted'),
        ),
      ),
    );
  }
}
