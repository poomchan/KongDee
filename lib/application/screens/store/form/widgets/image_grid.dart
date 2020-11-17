import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_cubit.dart';

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
                onTap: indexOption.fold(
                    () => context.read<StoreFormCubit>().picsChangeRequested,
                    (a) => null),
                child: AspectRatio(
                  aspectRatio: _aspectRatio,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: indexOption.fold(
                          () => Border.all(width: 3, color: Colors.black87),
                          (a) => null),
                    ),
                    child: indexOption.fold(
                      () => Icon(Icons.add),
                      (indx) => BlocBuilder<StoreFormCubit, StoreFormState>(
                        buildWhen: (p, c) => p.store.pics != c.store.pics,
                        builder: (context, state) =>
                            state.store.pics.getOrCrash()[indx].fileOrUrl.fold(
                                  (file) => Image.file(
                                    file,
                                    fit: BoxFit.cover,
                                    cacheWidth: 200,
                                  ),
                                  (url) => MyNetworkImage(imageUrl: url),
                                ),
                      ),
                    ),
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
                onTap: () =>
                    context.read<StoreFormCubit>().picDeleteRequested(indx),
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
      ),
    );
  }
}
