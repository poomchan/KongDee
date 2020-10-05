import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_form/store_form_cubit.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';

class BannerField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<StoreFormCubit, StoreFormState>(
      builder: (context, state) => Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
            child: GestureDetector(
              onTap: () =>
                  context.bloc<StoreFormCubit>().bannerChangeRequested(),
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
                child: state.isSaving
                    ? Container()
                    : state.store.banner.getOrCrash().fold(
                          (file) => Image.file(
                            file,
                            fit: BoxFit.cover,
                          ),
                          (url) => CachedNetworkImage(
                            imageUrl: url,
                            fit: BoxFit.cover,
                            placeholder: (context, str) =>
                                circularProgress(context),
                          ),
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
