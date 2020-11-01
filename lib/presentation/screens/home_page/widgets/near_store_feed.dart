import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/home/store_feed/store_near/store_near_cubit.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/store/widgets/store_card.dart';
import 'package:fluttertaladsod/presentation/screens/store/widgets/store_card2.dart';

class NearStoreFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeNearCubit = context.bloc<StoreNearCubit>();

    return BlocBuilder<StoreNearCubit, StoreNearState>(
      cubit: getIt<StoreNearCubit>()..watchNearbyStore(context),
      builder: (context, state) => state.maybeMap(
        inital: (state) => circularProgress(context),
        failure: (state) => Center(child: Icon(Icons.error)),
        orElse: () => Expanded(
          child: NotificationListener<ScrollNotification>(
            // onNotification: (ScrollNotification scrollInfo) {
            //   if (state.maybeMap(
            //         loaded: (state) => true,
            //         orElse: () => false,
            //       ) &&
            //       scrollInfo.metrics.atEdge) {
            //     // print('adding radius');
            //     // storeNearCubit.requestMoreRadius();
            //   }
            //   return true;
            // },
            onNotification: (_){return null;},
            child: ListView(
              clipBehavior: Clip.antiAlias,
              shrinkWrap: true,
              children: state.map(
                inital: (state) => [Container()],
                loading: (state) => [
                  ..._buildStoreCard(state.previousStoreList),
                  circularProgress(context),
                ],
                loaded: (state) => _buildStoreCard(state.storeList),
                failure: (state) => state.f.map(
                  noStore: (_) => [Text('No Store Nearby')],
                  unexpected: (_) => [Text('Unexpected Error')],
                  locationNotGranted: (_) => [
                    Text('Location is not granted'),
                    RaisedButton(
                      onPressed: () => storeNearCubit.watchNearbyStore(context),
                      child: Text('Try Again'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStoreCard(List<Store> storeList) {
    return storeList
        .map((store) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: StoreCard2(store: store),
            ))
        .toList();
  }
}
