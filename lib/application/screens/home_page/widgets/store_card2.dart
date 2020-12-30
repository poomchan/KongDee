// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/store/store.dart';

class StoreCard2 extends StatelessWidget {
  final Store store;

  const StoreCard2({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.storeViewPage, arguments: store.id),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBanner(),
            buildDescription(),
          ],
        ),
      ),
    );
  }

  Container buildDescription() {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            store.name.getOrCrash(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 100.0,
                child: Text(
                  store.location.address.getOrCrash(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox buildBanner() {
    return SizedBox(
      height: 125.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: store.banner.getOrCrash(),
            child: ColorFiltered(
              colorFilter: store.prefs.isOpen
                  ? const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.saturation,
                    )
                  : const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.saturation,
                    ),
              child: MyNetworkImage(imageUrl: store.banner.getOrCrash()),
            ),
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
    );
  }
}
