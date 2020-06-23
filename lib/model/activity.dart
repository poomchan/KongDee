import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as TimeAgo;

class Activity extends StatefulWidget {
  final String activityId;
  final String ownerId;
  final String ownerAvatarUrl;
  final String ownerName;
  final String text;
  final String mediaPreviewUrl;
  final String type;
  final dynamic timestamp;

  Activity(
      {@required this.activityId,
      @required this.ownerId,
      @required this.ownerAvatarUrl,
      @required this.ownerName,
      @required this.text,
      @required this.mediaPreviewUrl,
      @required this.type,
      @required this.timestamp});

  factory Activity.fromFirestoreDocument(DocumentSnapshot doc) {
    var data = doc.data;
    return Activity(
        activityId: data['activityId'],
        ownerId: data['ownerId'],
        ownerAvatarUrl: data['ownerAvatarUrl'],
        ownerName: data['ownerName'],
        text: data['text'],
        mediaPreviewUrl: data['mediaPreviewUrl'],
        type: data['type'],
        timestamp: data['timestamp']);
  }

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  Widget mediaPreview;
  String activityText;

  @override
  initState() {
    super.initState();
    configureActivity();
  }

  configureActivity() {
    String type = widget.type;
    if (type == 'comment' || type == 'like') {
      mediaPreview = Container(
        height: 50.0,
        width: 50.0,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(widget.mediaPreviewUrl),
              ),
            ),
          ),
        ),
      );
    } else if (type == 'follow') {
      mediaPreview = Container();
    }

    if (type == 'like') {
      activityText = 'liked your post';
    } else if (type == 'comment') {
      activityText = 'replied: ${widget.text}';
    } else if (type == 'follow') {
      activityText = 'is following you';
    } else {
      activityText = "Error: unknown type '$type'";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white38,
      padding: EdgeInsets.only(bottom: 2.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(widget.ownerAvatarUrl),
          backgroundColor: Colors.grey,
        ),
        title: RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          text: TextSpan(style: TextStyle(color: Colors.black), children: [
            TextSpan(
              text: '${widget.ownerName} ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: activityText,
              style: TextStyle(),
            )
          ]),
        ),
        trailing: mediaPreview,
        subtitle: Text(TimeAgo.format(widget.timestamp.toDate())),
      ),
    );
  }
}
