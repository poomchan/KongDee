import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/presentation/screens/store/chat/widgets/message_avatar.dart';
import 'package:fluttertaladsod/presentation/screens/store/chat/widgets/message_bubble.dart';

class Message extends StatelessWidget {
  final String text;
  final String avatarUrl;
  final bool isSender;
  final bool isTop;
  final String senderName;
  final Timestamp timestamp;
  static const double sidePaddding = 20.0;

  const Message({
    Key key,
    @required this.text,
    @required this.isSender,
    @required this.avatarUrl,
    @required this.isTop,
    @required this.senderName,
    @required this.timestamp,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: isSender
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: sidePaddding),
                              Container(
                                child: Text(
                                  TimeOfDay.fromDateTime(timestamp.toDate())
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
                        ),
                      ],
                    ),
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
                      Container(
                          // color: Colors.red,
                          child: Row(
                            children: [
                              Flexible(
                                child: MessageBubble(
                                  text: text,
                                  isSender: isSender,
                                  color: Colors.lightGreen[300],
                                  tail: isTop,
                                ),
                              ),
                              Container(
                                child: Text(
                                  TimeOfDay.fromDateTime(timestamp.toDate())
                                      .format(context),
                                  style: TextStyle(fontSize: 10.0),
                                ),
                              ),
                              SizedBox(width: sidePaddding),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
