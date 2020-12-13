import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_bloc.dart';
import 'package:get/get.dart';

class ImageGridView extends StatelessWidget {
  final int index;

  static const double _aspectRatio = 1;

  const ImageGridView({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: GestureDetector(
        onTap: () => print('zooming?'),
        child: AspectRatio(
          aspectRatio: _aspectRatio,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: GetBuilder<StoreViewBloc>(
              autoRemove: false,
              builder: (bloc) => bloc.progress.when(
                inital: () => circularProgress(context),
                loading: () => circularProgress(context),
                loaded: () => bloc.store.pics
                    .getOrCrash()[index]
                    .fileOrUrl
                    .fold((file) => throw 'network image cannot be File',
                        (url) => MyNetworkImage(imageUrl: url)),
                failure: () => Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
