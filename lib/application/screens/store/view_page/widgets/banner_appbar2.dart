import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';

import '../../constant.dart';

class BannerAppbar2 extends StatelessWidget {
  const BannerAppbar2();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      builder: (context, state) => SliverAppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        expandedHeight: kStoreBannerHeight,
        pinned: true,
        title: Text(
          state.map(
            inital: (state) => '',
            loading: (state) => '',
            success: (state) => state.store.name.getOrCrash(),
            failure: (state) => 'error',
          ),
        ),
        flexibleSpace: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: FlexibleSpaceBar(
            background: state.map(
              inital: (state) => circularProgress(context),
              loading: (state) => circularProgress(context),
              success: (state) => Hero(
                tag: state.store.banner.url,
                child: MyNetworkImage(
                  imageUrl: state.store.banner.url,
                  memCacheWidth: 600,
                ),
              ),
              failure: (state) => const Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
