import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/presentation/core/components/my_network_image.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';

class StoreCard2 extends StatelessWidget {
  final Store store;

  const StoreCard2({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          ExtendedNavigator.of(context).pushStoreViewPage2(storeId: store.id),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                height: 100.0,
                child: MyNetworkImage(imageUrl: store.banner.url),
              ),
              Positioned(
                  bottom: 8.0,
                  right: 8.0,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text('${store.distanceAway.toString()} km'),
                    ),
                  )),
            ]),
            Text(store.name.getOrCrash()),
            Text(store.formattedAddress),
          ],
        ),
      ),
    );
  }
}
