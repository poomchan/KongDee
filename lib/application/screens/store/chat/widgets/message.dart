import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/chat/message.dart';
import 'message_avatar.dart';
import 'message_bubble.dart';

class Message extends StatelessWidget {
  final MessageDomain m;
  final bool isTop;
  static const double sidePaddding = 20.0;
  static const double verticalPadding = 1.1;

  const Message(
    this.m, {
    Key key,
    @required this.isTop,
  })  : assert(
          m != null,
          isTop != null,
        ),
        super(key: key);

  bool get isSender => m.isSender;
  String get text => m.body.getOrCrash();
  String get senderId => m.senderId.getOrCrash();
  String get avatarUrl => m.senderAvatarUrl.getOrCrash();
  String get senderName => m.senderName.getOrCrash();
  Timestamp get timestamp => m.timestamp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: verticalPadding),
      child: isSender
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: sidePaddding),
                          Container(
                            child: Text(
                              TimeOfDay.fromDateTime(m.timestamp.toDate())
                                  .format(context),
                              style: TextStyle(fontSize: 10.0),
                            ),
                          ),
                          Flexible(
                            child: MessageBubble(
                              text: text,
                              isSender: isSender,
                              color: Colors.amber[500],
                              tail: isTop,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MessageAvatar(
                  avatarUrl: avatarUrl,
                  isSender: isSender,
                  hideAvatarImage: !isTop,
                  senderId: senderId,
                  senderName: senderName,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isTop
                          ? Text(
                              "  $senderName",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Container(),
                      Row(
                        children: [
                          Flexible(
                            child: MessageBubble(
                              text: text,
                              isSender: isSender,
                              color: Colors.lightGreen[300],
                              tail: isTop,
                            ),
                          ),
                          Text(
                            TimeOfDay.fromDateTime(timestamp.toDate())
                                .format(context),
                            style: TextStyle(fontSize: 10.0),
                          ),
                          SizedBox(width: sidePaddding),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
