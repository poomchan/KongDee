import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/home_page/info/info_bloc.dart';
import 'package:fluttertaladsod/domain/info/info.dart';
import 'package:get/get.dart';

class InfoView extends ViewWidget<InfoBloc> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoBloc>(
      builder: (bloc) => bloc.progress.when(
        inital: () => Text('initing..'),
        loading: () => circularProgress(),
        loaded: () => buildSuccessView(),
        failure: () => buildFailureWidget(),
      ),
    );
  }

  ListView buildSuccessView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: bloc.info.length,
      itemBuilder: (context, index) => buildInfoWidget(bloc.info[index]),
    );
  }

  Widget buildInfoWidget(InfoDomain info) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Get.theme.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info,
                color: Get.theme.primaryColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  info.title,
                  style: Get.textTheme.headline6
                      .copyWith(color: Get.theme.primaryColor),
                  // overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(info.body, style: Get.textTheme.bodyText1),
        ],
      ),
    );
  }

  Widget buildFailureWidget() {
    return bloc.failure.when(
      noInfo: () => const SizedBox(),
      serverFailure: () => const Text('server failure'),
      unexpected: (err) => Text('Err: $err'),
    );
  }

  const InfoView();
}
