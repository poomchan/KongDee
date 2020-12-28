import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/my_network_image.dart';
import 'package:fluttertaladsod/application/core/theme.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:get/get.dart';

import 'layout_helpers.dart';

class StoreCard extends StatelessWidget {
  final Store store;

  const StoreCard({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 100 / 30,
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.storeViewPage, arguments: store.id),
        child: Stack(
          children: [
            FlexibleTopLeftMargin(
              child: Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.deepPurple[100],
                  boxShadow: tBoxShadowGlobal,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 20,
                      child: AspectRatio(
                        aspectRatio: 130 / 100,
                        child: Hero(
                          tag: store.banner,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: MyNetworkImage(imageUrl: store.banner.getOrCrash()),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 10.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 120.0,
                              child: Text(
                                store.name.getOrCrash(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            _buildRxStoreOpenStatus(),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 100.0,
                              child: Text(
                                store.location.address.getOrCrash(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 60.0,
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black87),
                                  children: [
                                    TextSpan(
                                        text: store.location.distanceAway
                                            .toStringAsFixed(1)),
                                    TextSpan(
                                        text: ' km',
                                        style: TextStyle(fontSize: 12.0)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _buildRxStoreOpenStatus() {
    final isOpen = store.prefs.isOpen;
    return Container(
      width: 45,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isOpen ? Colors.lightGreenAccent[100] : Colors.black12,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        isOpen ? 'on' : 'off',
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
