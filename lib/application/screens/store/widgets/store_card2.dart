import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:get/get.dart';

class StoreCard2 extends StatelessWidget {
  final Store store;

  const StoreCard2({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.toNamed(Routes.storeViewPage, arguments: store.id),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: store.banner.url,
                    child: MyNetworkImage(imageUrl: store.banner.url),
                  ),
                  Positioned(
                    bottom: 8.0,
                    right: 8.0,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                            '${store.location.distanceAway.toStringAsFixed(1)} km'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(store.name.getOrCrash()),
            Text(store.location.address.getOrCrash()),
          ],
        ),
      ),
    );
  }
}
