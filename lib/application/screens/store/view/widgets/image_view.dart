// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/view/bloc/store_view_bloc.dart';
import 'image_grid_view.dart';

class ImageView extends StatelessWidget {
  const ImageView();
  
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      title: 'Photo',
      children: [
        GetBuilder<StoreViewBloc>(builder: (bloc) {
          return bloc.progress.when(
            inital: () => circularProgress(context),
            loading: () => circularProgress(context),
            loaded: () => _buildRxGridView(context),
            failure: () => Icon(Icons.error),
          );
        }),
      ],
    );
  }

  Widget _buildRxGridView(BuildContext context) {
    return GetX<StoreViewBloc>(
      builder: (bloc) => GridView.count(
        padding: EdgeInsets.all(0.0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        crossAxisCount: 2,
        childAspectRatio: 0.95,
        children: [
          ...List.generate(
            bloc.store.pics.length,
            (index) => ImageGridView(
                index:
                    index // pass index to bloc builder and to delete function in the grid
                ),
          ),
        ],
      ),
    );
  }
}
