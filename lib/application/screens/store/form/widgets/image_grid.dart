// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';

class ImageGrid extends StatelessWidget {
  // whether it is an empty grid or has an image
  final Option<int> indexOption;

  static const double _aspectRatio = 1;
  static const double _topRightMargin = 5.0;

  const ImageGrid({
    Key key,
    @required this.indexOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Get.find<StoreFormBloc>();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(right: _topRightMargin, top: _topRightMargin),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: GestureDetector(
              onTap: () => indexOption.fold(
                () => bloc.picsSelectionRequested(),
                (indx) => bloc.zoomImage(indx),
              ),
              child: AspectRatio(
                aspectRatio: _aspectRatio,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: indexOption.fold(
                        () => Border.all(width: 3, color: Colors.black87),
                        (a) => null),
                  ),
                  child: _buildRxImageWidget(),
                ),
              ),
            ),
          ),
        ),
        indexOption.fold(
          () => Container(),
          (indx) => Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => bloc.picDeleteRequested(indx),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 30.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRxImageWidget() {
    return indexOption.fold(
      () => Icon(Icons.add),
      (indx) => GetBuilder<StoreFormBloc>(
        builder: (bloc) => bloc.state.pics[indx].fold(
              (file) => Image.file(
                file,
                fit: BoxFit.cover,
                cacheWidth: 200,
              ),
              (url) => MyNetworkImage(imageUrl: url),
            ),
      ),
    );
  }
}
