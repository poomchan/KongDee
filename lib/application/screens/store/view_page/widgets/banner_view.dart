import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';

class BannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      builder: (context, state) => Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.0),
                ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 30.0,
                    spreadRadius: 1.0,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: state.map(
                  inital: (state) => circularProgress(context),
                  loading: (state) => circularProgress(context),
                  success: (state) => MyNetworkImage(
                        imageUrl: state.store.banner.url,
                        memCacheHeight: 500,
                        memCacheWidth: 600,
                      ),
                  failure: (state) => Icon(Icons.error)),
            ),
          ),
        ],
      ),
    );
  }
}
