import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:get/get.dart';
import 'image_grid_view.dart';

class ImageView extends StatelessWidget {
  final watcher = Get.find<StoreViewCubit>();
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      title: 'Photo',
      children: [
        BlocBuilder<StoreViewCubit, StoreViewState>(
          cubit: watcher,
          builder: (_, state) {
            return state.map(
              inital: (_) => circularProgress(context),
              loading: (_) => circularProgress(context),
              success: (s) => _buildGridView(context, s.store),
              failure: (s) => Icon(Icons.error),
            );
          }
        ),
      ],
    );
  }

  Widget _buildGridView(BuildContext context, Store store) {
    return GridView.count(
      padding: EdgeInsets.all(0.0),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      childAspectRatio: 0.95,
      children: [
        ...List.generate(
          store.pics.length,
          (index) => ImageGridView(
              index:
                  index // pass index to bloc builder and to delete function in the grid
              ),
        ),
      ],
    );
  }
}
