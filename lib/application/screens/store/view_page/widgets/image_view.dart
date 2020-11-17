import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';

import 'image_grid_view.dart';

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      title: 'Photo',
      children: [buildListTile(context)],
    );
  }

  Widget buildListTile(BuildContext context) {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      builder: (context, state) {
        return state.map(
          inital: (state) => circularProgress(context),
          loading: (state) => circularProgress(context),
          success: (state) => Container(
            // color: Colors.blue,
            child: GridView.count(
              padding: EdgeInsets.all(0.0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              crossAxisCount: 2,
              childAspectRatio: 0.95,
              children: [
                ...List.generate(
                  state.store.pics.length,
                  (index) => ImageGridView(
                      index:
                          index // pass index to bloc builder and to delete function in the grid
                      ),
                ),
              ],
            ),
          ),
          failure: (state) => Icon(Icons.error),
        );
      },
    );
  }
}
