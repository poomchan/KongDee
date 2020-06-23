import 'package:flutter/material.dart';
import 'package:fluttertaladsod/services/db_service.dart';

buildFollowingCarousel() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Posts you saved',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
      ),
      Divider(),
    ],
  );
}

class LikedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      children: <Widget>[buildFollowingCarousel()],
    );
  }
}
