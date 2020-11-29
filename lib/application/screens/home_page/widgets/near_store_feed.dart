import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/home_page/bloc/store_feed/nearby/store_near_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/widgets/store_card2.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:get/instance_manager.dart';

class NearStoreFeed extends StatelessWidget {
  final bloc = Get.put<StoreNearCubit>(StoreNearCubit());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stores close to you',
          style: TextStyle(fontSize: 25.0),
        ),
        const SizedBox(height: 10.0),
        const Divider(height: 0.0),
        _buildLoadingIndicator(context),
        BlocBuilder<StoreNearCubit, StoreNearState>(
          cubit: bloc..watchNearbyStore(),
          builder: (context, state) => state.map(
            inital: (_) => circularProgress(context),
            loading: (s) => _buildFeed(storeList: s.previousStoreList),
            loaded: (s) => _buildFeed(storeList: s.storeList),
            failure: (s) => _buildErrorWidgeds(s.f),
          ),
        ),
        ButtonBar(
          children: [
            BlocBuilder<StoreNearCubit, StoreNearState>(
              cubit: bloc,
              builder: (context, state) => state.maybeMap(
                loaded: (s) => Text('Searched in ${s.rad} km'),
                orElse: () => const SizedBox(height: 10.0 + 4.0),
              ),
            ),
            RaisedButton(
              onPressed: () => bloc.requestMoreRadius(),
              child: Text('Add Radius'),
            ),
            RaisedButton(
              onPressed: () => bloc.drainRadius(),
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
        mainAxisSpacing: 3,
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

  Widget _buildLoadingIndicator(BuildContext context) {
    return bloc.state.maybeMap(
      loading: (state) => linearProgress(context),
      orElse: () => const SizedBox(height: 10.0 + 4.0),
    );
  }

  Widget _buildErrorWidgeds(StoreFailure f) {
    return Center(
      child: f.map(
        noStore: (_) => Text(
          'No store nearby, try adding more radius',
        ),
        unexpected: (state) => Text(
          'Unexpected Error \n For nerds: ${state.e}',
        ),
        locationNotGranted: (_) => null,
        timeout: (_) => Column(
          children: [
            Text('Timeout'),
            TextButton(
              onPressed: () => bloc.watchNearbyStore(),
              child: Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}
