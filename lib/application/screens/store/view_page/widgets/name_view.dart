import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.store.name.getOrCrash(),
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w400),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        state.store.location.address.getOrCrash(),
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.w300,
                            ),
                            overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
              failure: (state) => Center(child: Icon(Icons.error)))
        ],
      ),
    );
  }
}
