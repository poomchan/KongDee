import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_cubit.dart';

import '../../constant.dart';

class BannerField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<StoreFormCubit, StoreFormState>(
      builder: (context, state) => Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
            child: GestureDetector(
              onTap: () =>
                  context.read<StoreFormCubit>().bannerChangeRequested(),
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
                child: state.isSaving
                    ? Container()
                    : state.store.banner.getOrCrash().fold(
                        (file) => Image.file(
                              file,
                              fit: BoxFit.cover,
                              cacheWidth: 600,
                            ),
                        (url) => MyNetworkImage(
                              imageUrl: url,
                              memCacheWidth: 600,
                            )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
