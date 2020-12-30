// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart' as dartz;
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/screens/store/form/bloc/store_form_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'image_grid.dart';

class ImageField extends StatelessWidget {
  const ImageField();

  @override
  Widget build(BuildContext context) {
    return ReusableCard(title: 'Photo', children: [buildListTile(context)]);
  }

  Widget buildListTile(BuildContext context) {
    return GetBuilder<StoreFormBloc>(
      builder: (bloc) {
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
              bloc.store.pics.length,
              (index) => ImageGrid(
                indexOption: dartz.some(
                    index), // pass index to bloc builder and to delete function in the grid
              ),
            ),
            ImageGrid(
              indexOption: dartz.none(), // for an empty grid to add new pic
            ),
          ],
        );
      },
    );
  }
}
