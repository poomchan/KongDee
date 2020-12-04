import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/home_page/bloc/store_feed/near_store_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/widgets/store_card2.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:get/get.dart';

class NearStoreFeed extends StatelessWidget {
  final bloc = Get.find<NearStoreBloc>();

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
        _buildRxLoadingIndicator(context),
        GetBuilder<NearStoreBloc>(
          builder: (b) => b.state.map(
            inital: (_) => circularProgress(context),
            loading: (_) => _buildRxStoreFeed(),
            loaded: (_) => _buildRxStoreFeed(),
            failure: (_) => _buildErrorWidget(),
          ),
        ),
        ButtonBar(
          children: [
            GetBuilder<NearStoreBloc>(
              builder: (_) => bloc.state.maybeMap(
                loaded: (s) => _buildRxTextRadius(),
                loading: (s) => _buildRxTextRadius(),
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

  Widget _buildRxTextRadius() {
    return Obx(
      () => Text('Searched in ${bloc.rad} km'),
    );
  }

  Widget _buildRxStoreFeed() {
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 8,
          mainAxisSpacing: 3,
          childAspectRatio: 0.7,
        ),
        itemCount: bloc.storeList.length,
        itemBuilder: (context, index) => _buildStoreCard(bloc.storeList[index]),
      ),
    );
  }

  Widget _buildStoreCard(Store store) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StoreCard2(store: store),
    );
  }

  Widget _buildRxLoadingIndicator(BuildContext context) {
    return GetBuilder<NearStoreBloc>(
      builder: (bloc) => bloc.state.maybeMap(
        loading: (_) => linearProgress(context),
        orElse: () => const SizedBox(height: 10.0 + 4.0),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: bloc.failure.map(
        noStore: (_) => Text(
          'No store nearby, try adding more radius',
        ),
        unexpected: (f) => Text(
          'Unexpected Error \n For nerds: ${f.detail}',
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
