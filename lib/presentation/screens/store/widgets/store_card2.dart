import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/presentation/core/components/my_network_image.dart';

class StoreCard2 extends StatelessWidget {
  final Store store;

  const StoreCard2({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyNetworkImage(imageUrl: store.banner.url),
          Text(store.name.getOrCrash()),
        ],
      ),
    );
  }
}
