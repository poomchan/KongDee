import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_form/store_form_cubit.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/image_grid.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/reusable_card.dart';

class ImageField extends StatefulWidget {
  @override
  _ImageFieldState createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(title: 'Photo', children: [buildListTile(context)]);
  }

  Widget buildListTile(BuildContext context) {
    return BlocBuilder<StoreFormCubit, StoreFormState>(
      // buildWhen: (p, c) => p.newStorePics.length != c.newStorePics.length,
      builder: (context, state) {
        return Container(
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
                (index) => ImageGrid(
                  indexOption: dartz.some(
                      index), // pass index to bloc builder and to delete function in the grid
                ),
              ),
              ImageGrid(
                indexOption: dartz.none(), // for an empty grid to add new pic
              ),
            ],
          ),
        );
      },
    );
  }
}
