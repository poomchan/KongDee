import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_view/store_view_cubit.dart';
import 'package:fluttertaladsod/presentation/core/components/my_network_image.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/store/constant.dart';

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
                tag: state.store.banner,
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
