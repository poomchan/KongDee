import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class BannerAppbar2 extends StatelessWidget {
  final bloc = Get.find<StoreViewCubit>();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      cubit: bloc,
      builder: (_, state) => state.map(
        inital: (_) => circularProgress(context),
        loading: (_) => circularProgress(context),
        failure: (state) => const Icon(Icons.error),
        success: (s) => Hero(
          tag: s.store.banner.url,
          child: MyNetworkImage(
            imageUrl: s.store.banner.url,
            memCacheWidth: 600,
          ),
        ),
      ),
    );
  }

  Widget _rxStoreName() {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      cubit: bloc,
      builder: (_, state) => state.map(
        inital: (state) => Text('Cubit in in initial state'),
        loading: (state) => Text(''),
        success: (state) => Text(state.store.name.getOrCrash()),
        failure: (state) => Text('error'),
      ),
    );
  }
}
