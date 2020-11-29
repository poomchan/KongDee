import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/form/widgets/reusable_card.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:get/get.dart';

class NameView extends StatelessWidget {
  final watcher = Get.find<StoreViewCubit>();

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      children: [
        BlocBuilder<StoreViewCubit, StoreViewState>(
          cubit: watcher,
          builder: (_, state) {
            return state.map(
              inital: (_) => circularProgress(context),
              loading: (_) => circularProgress(context),
              success: (s) => _buildNameField(context, s.store),
              failure: (s) => _buildFailureWidget(s.f),
            );
          }
        )
      ],
    );
  }

  Widget _buildNameField(BuildContext context, Store store) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          store.name.getOrCrash(),
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          store.location.address.getOrCrash(),
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black87,
            fontWeight: FontWeight.w300,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildFailureWidget(StoreFailure f) {
    return Center(child: Icon(Icons.error));
  }
}
