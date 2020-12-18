import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/action/chat_user_action_sheet_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/message_view/message_view_bloc.dart';
import 'package:get/get.dart';

class MessageAvatar extends ViewWidget<MessageViewBloc> {
  final String senderId;
  final String avatarUrl;
  final bool isSender;
  final bool hideAvatarImage;
  final String senderName;

  static const double radius = 20.0;

  get actionBloc => Get.find<ChatUserActionSheetBloc>();

  const MessageAvatar({
    Key key,
    @required this.avatarUrl,
    @required this.isSender,
    @required this.hideAvatarImage,
    @required this.senderId,
    @required this.senderName, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (hideAvatarImage)
          Container(width: radius * 2)
        else
          GestureDetector(
            onTap: () => actionBloc.onMessageAvatarTapped(senderName, senderId),
            child: CircleAvatar(
              radius: radius,
              backgroundImage: CachedNetworkImageProvider(avatarUrl),
              backgroundColor: Colors.white,
            ),
          ),
      ],
    );
  }
}
