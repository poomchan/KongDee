// Flutter imports:
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/language/translation_base.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/home_page/bloc/near_store_bloc.dart';
import 'package:fluttertaladsod/application/screens/home_page/widgets/store_card2.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'buttons.dart';

class NearStoreFeed extends ViewWidget<NearStoreBloc> {
  const NearStoreFeed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TrBase.storeCloseToYou.tr,
          style: TextStyle(fontSize: 25.0),
        ),
        const SizedBox(height: 10.0),
        const Divider(height: 0.0),
        _buildRxLoadingIndicator(context),
        GetBuilder<NearStoreBloc>(
          builder: (bloc) => bloc.progress.when(
            inital: () => circularProgress(context),
            loading: () => _buildRxStoreFeed(),
            loaded: () => _buildRxStoreFeed(),
            failure: () => _buildErrorWidget(),
          ),
        ),
        StoreFeedButton(),
      ],
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
    if (store.failureOption.isSome()) {
      final f = store.failureOption.getOrElse(() => null);
      print('$f: ${f.failedValue}');
      return Card(
        color: Colors.white10,
        child: Icon(Icons.error),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: StoreCard2(store: store),
    );
  }

  Widget _buildRxLoadingIndicator(BuildContext context) {
    return GetBuilder<NearStoreBloc>(
      builder: (bloc) => bloc.progress.maybeWhen(
        loading: () => circularProgress(),
        orElse: () => const SizedBox(height: 10.0 + 4.0),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: bloc.failure.when(
        noStore: () => Text(
          'No store nearby, try adding more radius',
        ),
        unexpected: (e) => Text(
          'Unexpected Error \n For nerds: $e',
        ),
        locationNotGranted: () => null,
        timeout: () => Column(
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

