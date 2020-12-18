import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/profile/setting/bloc/blocked_store_bloc.dart';
import 'package:fluttertaladsod/application/screens/profile/widgets/store_card.dart';
import 'package:get/get.dart';

class BlockedStoreSetting extends ViewWidget<BlockedStoreBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocked stores'),
      ),
      body: GetBuilder<BlockedStoreBloc>(
        builder: (bloc) => bloc.progress.when(
          inital: () => const Text('init state'),
          loading: () => circularProgress(),
          loaded: () => ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: bloc.storeList.length,
            itemBuilder: (context, indx) => StoreCard(
              store: bloc.storeList[indx],
            ),
          ),
          failure: () => Icon(Icons.error),
        ),
      ),
    );
  }
}
