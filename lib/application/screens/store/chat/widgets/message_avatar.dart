import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MessageAvatar extends StatelessWidget {
  final String avatarUrl;
  final bool isSender;
  final bool hideAvatarImage;

  static const double radius = 20.0;

  const MessageAvatar({
    Key key,
    @required this.avatarUrl,
    @required this.isSender,
    @required this.hideAvatarImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        hideAvatarImage
            ? Container(width: radius * 2)
            : CircleAvatar(
                radius: radius,
                backgroundImage: CachedNetworkImageProvider(avatarUrl),
                backgroundColor: Colors.white,
              ),
      ],
    );
  }
}