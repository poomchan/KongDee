import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_action_sheet_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class BannerAppbar2 extends ViewWidget<StoreViewBloc> {
  const BannerAppbar2();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [buildMoreButton()],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      expandedHeight: kStoreBannerHeight,
      pinned: true,
      title: _rxStoreName(),
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: FlexibleSpaceBar(
          background: _rxBuildBackground(context),
        ),
      ),
    );
  }

  Widget _rxBuildBackground(BuildContext context) {
    return GetX<StoreViewBloc>(
      builder: (bloc) => bloc.progress.when(
        inital: () => circularProgress(context),
        loading: () => circularProgress(context),
        failure: () => const Icon(Icons.error),
        loaded: () => Hero(
          tag: bloc.store.banner.url,
          child: MyNetworkImage(
            imageUrl: bloc.store.banner.url,
            memCacheWidth: 600,
          ),
        ),
      ),
    );
  }

  Widget buildMoreButton() {
    return GetBuilder<StoreActionSheetBloc>(
      builder: (bloc) => bloc.isStoreOwner
          ? IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: bloc.onMoreTapped,
            )
          : const SizedBox(),
    );
  }

  Widget _rxStoreName() {
    return GetX<StoreViewBloc>(
      builder: (bloc) => bloc.progress.when(
        inital: () => Text('Cubit in in initial state'),
        loading: () => Text(''),
        loaded: () => Text(bloc.store.name.getOrCrash()),
        failure: () => Text('error'),
      ),
    );
  }
}
