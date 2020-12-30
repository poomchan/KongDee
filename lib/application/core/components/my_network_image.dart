import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';

class MyNetworkImage extends StatelessWidget {
  final String imageUrl;
  final int memCacheHeight;
  final int memCacheWidth;
  final BoxFit fit;

  const MyNetworkImage({
    Key key,
    @required this.imageUrl,
    this.memCacheHeight,
    this.memCacheWidth = 200,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      memCacheHeight: memCacheHeight,
      memCacheWidth: memCacheWidth,
      placeholder: (context, url) => circularProgress(context),
      errorWidget: (context, url, err) => Center(
        child: Text(getErrorString(err)),
      ),
    );
  }

  String getErrorString(dynamic err) {
    print(err.runtimeType);
    if (err is HttpException) {
      final code = err.message.split(':').last.trimLeft();
      if (code == '404') return 'Image not found';
      return 'Http Error : $code';
    }
    return 'Unknown error';
  }
}
