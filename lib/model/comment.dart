import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as TimeAgo;

class Comment extends StatelessWidget {
  final String commentId;
  final String ownerId;
  final String text;
  final Timestamp timestamp;
  final String ownerAvatar;
  final String ownerName;

  Comment(
      {this.commentId,
      this.ownerId,
      this.text,
      this.timestamp,
      this.ownerAvatar,
      this.ownerName});

  factory Comment.fromDocument(DocumentSnapshot doc) {
    return Comment(
      commentId: doc['commentId'],
      ownerId: doc['ownerId'],
      text: doc['text'],
      timestamp: doc['timestamp'],
      ownerName: doc['ownerName'],
      ownerAvatar: doc['ownerAvatar'],
    );
  }

  buildCircleAvatar() {
    return CircleAvatar(
      backgroundImage: CachedNetworkImageProvider(ownerAvatar),
      radius: 20.0,
      backgroundColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: buildCircleAvatar(),
      title: Text(text),
      subtitle: Text(TimeAgo.format(timestamp.toDate())),
    );
  }
}
