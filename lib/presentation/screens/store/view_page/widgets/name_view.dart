import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_view/store_view_cubit.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/store/form/widgets/reusable_card.dart';

class NameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreViewCubit, StoreViewState>(
      builder: (context, state) => ReusableCard(
        children: [
          state.map(
              inital: (state) => circularProgress(context),
              loading: (state) => circularProgress(context),
              success: (state) => Column(
                    children: [
                      Text(
                        state.store.name.getOrCrash(),
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w400),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        state.store.formattedAddress,
                        style: TextStyle(fontSize: 20.0, color: Colors.black87),
                      ),
                    ],
                  ),
              failure: (state) => Center(child: Icon(Icons.error)))
        ],
      ),
    );
  }
}
