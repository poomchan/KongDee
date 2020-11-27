import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/home_page/bloc/store_feed/nearby/store_near_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/widgets/store_card2.dart';
import 'package:fluttertaladsod/domain/store/store.dart';

class NearStoreFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildViewFeed(context);
  }

  Widget _buildViewFeed(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stores close to you',
          style: TextStyle(fontSize: 25.0),
        ),
        const SizedBox(height: 10.0),
        const Divider(height: 0.0),
        _buildLoadingIndicator(),
        BlocBuilder<StoreNearCubit, StoreNearState>(
          builder: (context, state) => state.map(
            inital: (state) => circularProgress(context),
            loading: (state) =>
                _buildFeed(storeList: state.previousStoreList),
            failure: (state) => Center(
              child: state.f.map(
                noStore: (_) => Text('No store nearby, try adding more radius'),
                unexpected: (state) =>
                    Text('Unexpected Error \n For nerds: ${state.e}'),
                locationNotGranted: (_) => null,
                timeout: (_) => Column(
                  children: [
                    Text('Timeout'),
                    TextButton(
                      onPressed: () =>
                          context.read<StoreNearCubit>().watchNearbyStore(),
                      child: Text('Try again'),
                    ),
                  ],
                ),
              ),
            ),
            loaded: (state) => _buildFeed(storeList: state.storeList),
          ),
        ),
        ButtonBar(
          children: [
            BlocBuilder<StoreNearCubit, StoreNearState>(
              builder: (context, state) => state.maybeMap(
                loaded: (state) => Text('Searched in ${state.rad} km'),
                orElse: () => const SizedBox(height: 10.0 + 4.0),
              ),
            ),
            RaisedButton(
              onPressed: () =>
                  context.read<StoreNearCubit>().requestMoreRadius(),
              child: Text('Add Radius'),
            ),
            RaisedButton(
              onPressed: () => context.read<StoreNearCubit>().drainRadius(),
              child: Text('Drain Radius'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeed({@required List<Store> storeList}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
      itemCount: storeList.length,
      itemBuilder: (context, index) => _buildStoreCard(storeList[index]),
    );
  }

  Widget _buildStoreCard(Store store) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StoreCard2(store: store),
    );
  }

  Widget _buildLoadingIndicator(){
    return BlocBuilder<StoreNearCubit, StoreNearState>(
          builder: (context, state) => state.maybeMap(
            loading: (state) => linearProgress(context),
            orElse: () => const SizedBox(height: 10.0 + 4.0),
          ),
        );
  }
}
