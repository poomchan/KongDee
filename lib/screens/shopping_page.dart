import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertaladsod/components/progress_indicators.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/model/post.dart';
import 'package:fluttertaladsod/services/db_service.dart';
import 'package:fluttertaladsod/services/location_service.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  StreamSubscription postStream;
  BehaviorSubject<double> radius = BehaviorSubject<double>.seeded(100.0);
  List<Post> postList = [];
  bool isFetchingPosts = false;

  @override
  void initState() {
    super.initState();

    // get posts
    handleGetFeedPosts();
  }

  @override
  void dispose() {
    super.dispose();
    postStream?.cancel();
  }

  buildPosts(List<DocumentSnapshot> docList) {
    List<Post> newPosts = [];
//    print('building posts');
//    print(docList);
    print('feed has ${docList.length} posts');

    docList.forEach((DocumentSnapshot doc) {
      // deserialize the data
      Post post = Post.fromDocument(doc);
      newPosts.add(post);
    });

    // sort new => old
    newPosts.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    if (!mounted) {
      return;
    }

    // add to state
    setState(() {
      postList.addAll(newPosts);
      isFetchingPosts = false;
    });
  }

  fetchMorePost(double rad) {
    setState(() {
      radius.add(rad);
    });
  }

  handleGetFeedPosts() async {
    setState(() {
      isFetchingPosts = true;
    });
    // get user location
    await locationService.getUserLocation();

    Geoflutterfire geo = Geoflutterfire();

    // define the center point where the user currently is
    GeoFirePoint center = geo.point(
        latitude: locationService.lat, longitude: locationService.lon);

    // make a ref to firestore (thanks to group collection query)
    var postsRef = dbService.postsRef;

    if (!mounted) {
      return;
    }

    setState(() {
      postStream = radius.switchMap((rad) {
//        print('listening to the stream');
        return geo
            .collection(collectionRef: postsRef)
            .within(center: center, radius: rad, field: 'geoPoint');
      }).listen((buildPosts));
    });
  }

  buildPostView() {
    if (isFetchingPosts) {
      return circularProgress(context);
    }
    return Column(
      children: postList,
    );
  }

  buildCategoryCarousel() {
    List<String> _categoryList =
        Provider.of<NetworkStateStorage>(context).categoryList;
    Map<String, String> _categoryMap =
        Provider.of<NetworkStateStorage>(context).categoryMap;
//    print('Categories: ${_categoryList.length}');

    return Container(
      height: 160.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // minus 1 to exclude "select category"
        itemCount: _categoryList.length - 1,
        itemBuilder: (context, index) {
          index = index + 1;
          String category = _categoryList[index];
          String description = _categoryMap.values.toList()[index];
          return Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: 120.0,
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20.0)),
                // TODO: Add pictures here
                child: null,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 120.0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Text(
                        category,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            letterSpacing: 0.3),
                      ),
                      Text(
                        description,
                        style: TextStyle(color: Colors.black54, fontSize: 13.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: build no post page
    return Scaffold(
      body: ListView(
        children: <Widget>[
          buildCategoryCarousel(),
          buildPostView(),
        ],
      ),
    );
  }
}
