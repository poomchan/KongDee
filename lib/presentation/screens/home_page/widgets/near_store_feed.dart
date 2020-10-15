import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/home/store_feed/store_near/store_near_cubit.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/store/store_card.dart';

class NearStoreFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreNearCubit, StoreNearState>(
      cubit: getIt<StoreNearCubit>()..watchNearbyStore(context),
      builder: (context, state) => state.maybeMap(
        inital: (state) => circularProgress(context),
        failure: (state) => Center(child: Icon(Icons.error)),
        orElse: () => Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (state.maybeMap(
                    loaded: (state) => true,
                    orElse: () => false,
                  ) &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                print('adding radius');
                context.bloc<StoreNearCubit>().requestMoreRadius();
              }
              return null;
            },
            child: ListView(
              clipBehavior: Clip.antiAlias,
              shrinkWrap: true,
              children: state.maybeMap(
                  loading: (state) => [
                        circularProgress(context),
                        ..._buildStoreCard(state.previousStoreList),
                      ],
                  loaded: (state) => _buildStoreCard(state.storeList),
                  orElse: () => [Container()]),
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
              child: StoreCard(store: store),
            ))
        .toList();
  }
}