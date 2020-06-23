import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/model/post.dart';
import 'package:fluttertaladsod/screens/full_profile_post_page.dart';

class PostTile extends StatelessWidget {
  final int postIndex;
  final Post post;
  final List<Post> postList;

  PostTile(
      {@required this.post, @required this.postList, @required this.postIndex});

  handleNavigateToFullPostPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullProfilePostPage(
          postList: postList,
          initialIndex: postIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleNavigateToFullPostPage(context),
      child: CachedNetworkImage(
        imageUrl: post.mediaUrls[0],
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
          );
        },
        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
        fit: BoxFit.cover,
      ),
    );
  }
}
