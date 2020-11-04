import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/home/store_feed/nearby/store_near_cubit.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/store/widgets/store_card2.dart';

class NearStoreFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreNearCubit, StoreNearState>(
      cubit: getIt<StoreNearCubit>()..watchNearbyStore(context),
      builder: (context, state) => state.map(
        inital: (state) => circularProgress(context),
        loading: (state) => circularProgress(context),
        failure: (state) => Center(child: Icon(Icons.error)),
        loaded: (state) => Expanded(
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
            onNotification: (_) {
              return null;
            },
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: state.storeList.length,
              itemBuilder: (context, index) =>
                  _buildStoreCard(state.storeList[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStoreCard(Store store) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StoreCard2(store: store),
    );
  }
}

// ListView(
//               clipBehavior: Clip.antiAlias,
//               shrinkWrap: true,
//               children: state.map(
//                 inital: (state) => [Container()],
//                 loading: (state) => [
//                   ..._buildStoreCard(state.previousStoreList),
//                   circularProgress(context),
//                 ],
//                 loaded: (state) => _buildStoreCard(state.storeList),
//                 failure: (state) => state.f.map(
//                   noStore: (_) => [Text('No Store Nearby')],
//                   unexpected: (_) => [Text('Unexpected Error')],
//                   locationNotGranted: (_) => [
//                     Text('Location is not granted'),
//                     RaisedButton(
//                       onPressed: () => storeNearCubit.watchNearbyStore(context),
//                       child: Text('Try Again'),
//                     )
//                   ],
//                 ),
//               ),
//             ),
