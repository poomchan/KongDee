import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/home_page/bloc/near_store_bloc.dart';
import 'package:get/get.dart';

class StoreFeedButton extends ViewWidget<NearStoreBloc> {
  const StoreFeedButton({
    Key key,
  }) : super(key: key);

  Widget _buildRxTextRadius() {
    return Obx(
      () => Text(
        'Searched in ${bloc.rad} km',
        style: Get.theme.textTheme.bodyText2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<NearStoreBloc>(
          builder: (bloc) => bloc.progress.maybeWhen(
            loaded: () => _buildRxTextRadius(),
            loading: () => _buildRxTextRadius(),
            orElse: () => const SizedBox(height: 10.0 + 4.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: RaisedButton(
                  onPressed: bloc.requestMoreRadius,
                  textColor: Colors.black,
                  child: Text('Add Radius'),
                ),
              ),
              const SizedBox(width: 10),
              RaisedButton(
                padding: EdgeInsets.zero,
                color: Get.theme.primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: bloc.onResetTapped,
                child: Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
