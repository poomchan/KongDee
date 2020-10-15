import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_view/store_view_cubit.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';

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
                  success: (state) => CachedNetworkImage(
                    imageUrl: state.store.banner.url,
                    fit: BoxFit.cover,
                    placeholder: (context, str) =>
                        circularProgress(context),
                  ),
                  failure: (state) => Icon(Icons.error)),
            ),
          ),
        ],
      ),
    );
  }
}
