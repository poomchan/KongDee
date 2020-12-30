// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import '../../constant.dart';

class BannerField extends ViewWidget<StoreFormBloc> {
  const BannerField();

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0),
          ),
          child: GestureDetector(
            onTap: () => bloc.bannerChangeRequested(),
            child: Container(
              width: screenWidth,
              height: kStoreBannerHeight,
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
              child: _buildRxBackground(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRxBackground() {
    return GetBuilder<StoreFormBloc>(
      builder: (bloc) => bloc.store.banner.fold(
            (file) => Image.file(
              file,
              fit: BoxFit.cover,
              cacheWidth: 600,
            ),
            (url) => MyNetworkImage(
              imageUrl: url,
              memCacheWidth: 600,
            ),
          ),
    );
  }
}
