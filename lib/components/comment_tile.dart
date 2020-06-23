import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/model/user.dart';

class CommentTile extends StatelessWidget {
  final User user;
  final String commentId;

  const CommentTile({Key key, this.user, this.commentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(user.photoURL),
        backgroundColor: Colors.white54,
      ),
    );
  }
}
