import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';

class ImageGridView extends StatelessWidget {
  final int index;

  static const double _aspectRatio = 1;
  static const double _topRightMargin = 5.0;

  const ImageGridView({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin:
                EdgeInsets.only(right: _topRightMargin, top: _topRightMargin),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: GestureDetector(
                onTap: () => print('zooming?'),
                child: AspectRatio(
                  aspectRatio: _aspectRatio,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: BlocBuilder<StoreViewCubit, StoreViewState>(
                      builder: (context, state) => state.map(
                          inital: (state) => circularProgress(context),
                          loading: (state) => circularProgress(context),
                          success: (state) => state.store.pics
                              .getOrCrash()[index]
                              .fileOrUrl
                              .fold(
                                (file) => throw 'network image cannot be File',
                                (url) => MyNetworkImage(imageUrl: url)
                              ),
                          failure: (state) => Icon(Icons.error)),
                    ),
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
