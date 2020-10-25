import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/core/theme.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';

import '../../profile/widgets/layout_helpers.dart';

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
        onTap: () {
          ExtendedNavigator.of(context).push(Routes.storeViewPage,
              arguments: StoreViewPageArguments(storeId: store.id));
        },
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: CachedNetworkImage(
                            imageUrl: store.banner.url,
                            fit: BoxFit.cover,
                            placeholder: (context, str) =>
                                circularProgress(context),
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
                  child: Container(
                    // color: Colors.blue,
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  store.name.getOrCrash(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 45,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.lightGreenAccent[100],
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                children: const [
                                  Text(
                                    'on',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 150.0,
                              child: Text(
                                store.formattedAddress,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Spacer(),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.black87),
                                children: [
                                  TextSpan(text: store.distanceAway.toString()),
                                  TextSpan(
                                      text: ' km',
                                      style: TextStyle(fontSize: 12.0)),
                                ],
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
}
