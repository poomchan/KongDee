import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/components/progress_indicators.dart';
import 'package:fluttertaladsod/constant.dart';
import 'package:fluttertaladsod/storage/local_state_storage.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/model/user.dart';
import 'package:fluttertaladsod/screens/comment_page.dart';
import 'package:fluttertaladsod/services/db_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Post extends StatefulWidget {
  final String ownerName;
  final String ownerId;
  final String postId;
  final String caption;
  final String address;
  final String category;
  final List mediaUrls;
  final Map geoPoint;
  final dynamic likes;
  final dynamic timestamp;

  Post({
    this.ownerName,
    this.ownerId,
    this.postId,
    this.caption,
    this.address,
    this.category,
    this.mediaUrls,
    this.likes,
    this.geoPoint,
    this.timestamp,
  });

  factory Post.fromDocument(DocumentSnapshot doc) {
    return Post(
      ownerName: doc['ownerName'] ?? 'unknown',
      ownerId: doc['ownerId'] ?? 'unknown',
      caption: doc['caption'] ?? '',
      address: doc['formattedLocation'] ?? 'unknown',
      category: doc['category'] ?? 'unknown',
      mediaUrls: doc['mediaUrls'] ?? 'unknown',
      geoPoint: doc['geoPoint'],
      likes: doc['likes'],
      timestamp: doc['timestamp'],
      postId: doc['postId'] ?? '',
    );
  }

  int getLikeCount(Map likes) {
    // if no likes => zero
    if (likes == null) {
      return 0;
    }
    int count = 0;

    // if the key is true, add a like
    likes.values.forEach((val) {
      if (val == true) {
        count++;
      }
    });

    return count;
  }

  @override
  _PostState createState() {
    return _PostState(
      ownerId: this.ownerId,
      ownerName: this.ownerName,
      caption: this.caption,
      address: this.address,
      category: this.category,
      mediaUrls: this.mediaUrls,
      geoPoint: this.geoPoint,
      likes: this.likes,
      likeCount: getLikeCount(likes),
      postTime: this.timestamp,
      postId: this.postId,
    );
  }
}

class _PostState extends State<Post> {
  final String ownerName;
  final String ownerId;
  final String postId;
  final String caption;
  final String address;
  final String category;
  final List mediaUrls;
  final Map geoPoint;
  final dynamic postTime;
  Map likes;
  int likeCount;

  // to show that user has liked the post or not
  bool isLiked;

  bool isSaved = false;

  _PostState({
    this.ownerName,
    this.ownerId,
    this.postId,
    this.caption,
    this.address,
    this.category,
    this.mediaUrls,
    this.geoPoint,
    this.likes,
    this.likeCount,
    this.postTime,
  });

  @override
  initState() {
    super.initState();
  }

  getIsSaved(User user) async {
    print('fetching data');
    var doc = await dbService.postsRef
        .document(postId)
        .collection('saves')
        .document(user.id)
        .get();

    if (doc.exists) {
      print('doc exists');

      if (!mounted) {
        return;
      }
      setState(() {
        isSaved = true;
      });
    }
  }

  buildPostHeader() {
    return FutureBuilder(
      future: dbService.userRef.document(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress(context);
        }
        User user = User.fromDocument(snapshot.data);
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(user.photoURL),
            backgroundColor: Colors.white54,
          ),
          title: GestureDetector(
            onTap: () => print('showing profile'),
            child: Text(
              user.displayName,
              style: TextStyle(
                  color: kBeautifulBlackColor, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(address),
          trailing: IconButton(
            onPressed: () => print('editting post'),
            icon: Icon(Icons.more_horiz),
          ),
        );
      },
    );
  }

  buildImageListView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300.0,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mediaUrls.length,
        itemBuilder: (context, int currentIndex) {
          return CachedNetworkImage(
            imageUrl: mediaUrls[currentIndex],
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              );
            },
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  buildPostImages() {
    return GestureDetector(
      onDoubleTap: !isLiked ? handleLikePost : () {},
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildImageListView(),
        ],
      ),
    );
  }

  handleLikePost() {
    // check that the user has liked the post or not
    final User currentUser =
        Provider.of<NetworkStateStorage>(context, listen: false).currentUser;

    final CollectionReference _postRef = dbService.postsRef;
    bool _isLiked = likes[currentUser?.id] == true;

    // perform unlike post
    if (_isLiked) {
      setState(() {
        likeCount -= 1;
        isLiked = false;
        likes[currentUser?.id] = false;
      });

      _postRef.document(postId).updateData({
        'likes.${currentUser?.id}': false,
      });
    } else if (!_isLiked) {
      // perform liking post
      setState(() {
        likeCount += 1;
        isLiked = true;
        likes[currentUser?.id] = true;
      });

      _postRef.document(postId).updateData({
        'likes.${currentUser?.id}': true,
      });

      dbService.uploadActivity(
          type: 'like', userId: ownerId, previewUrl: mediaUrls[0], text: '');
    }
  }

  handleShowComments() {
    Provider.of<LocalStateStorage>(context, listen: false)
        .setFocusingPost(widget);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommentPage(),
      ),
    );
  }

  handleSavePost() async {
    // check that the user has liked the post or not
    final User currentUser =
        Provider.of<NetworkStateStorage>(context, listen: false).currentUser;

    final CollectionReference _postRef = dbService.postsRef;

    // perform un-saving post
    if (isSaved) {
      print('unsaving');
      setState(() {
        isSaved = false;
      });

      _postRef
          .document(postId)
          .collection('saves')
          .document(currentUser?.id)
          .setData({
        'ownerId': currentUser.id,
        'timestamp': DateTime.now(),
        'isSaved': false,
      }, merge: true);
    } else if (!isSaved) {
      // perform saving post
      print('saving');

      setState(() {
        isSaved = true;
      });

      _postRef
          .document(postId)
          .collection('saves')
          .document(currentUser?.id)
          .setData({
        'ownerId': currentUser.id,
        'timestamp': DateTime.now(),
        'isSaved': true,
      }, merge: true);
    }
  }

  buildPostFooter() {
    User user = Provider.of<NetworkStateStorage>(context).currentUser;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: handleLikePost,
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    size: 28.0,
                    color: kBeautifulBlackColor,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: handleShowComments,
                  child: Icon(
                    Icons.chat,
                    size: 28.0,
                    color: kBeautifulBlackColor,
                  ),
                ),
                Spacer(),
                StreamBuilder<Object>(
                    stream: dbService.postsRef
                        .document(postId)
                        .collection('saves')
                        .document(user?.id)
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData || !snapshot.data.exists) {
                        return GestureDetector(
                          onTap: handleSavePost,
                          child: Icon(
                            Icons.bookmark_border,
                            size: 28.0,
                            color: kBeautifulBlackColor,
                          ),
                        );
                      }

                      bool isSaved = snapshot.data?.data['isSaved'];

                      return GestureDetector(
                        onTap: handleSavePost,
                        child: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border,
                          size: 28.0,
                          color: kBeautifulBlackColor,
                        ),
                      );
                    })
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  '$likeCount likes',
                  style: TextStyle(
                      color: kBeautifulBlackColor, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  '$ownerName',
                  style: TextStyle(
                      color: kBeautifulBlackColor, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(caption ?? ''),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User _currentUser =
        Provider.of<NetworkStateStorage>(context).currentUser;
    isLiked = (likes[_currentUser.id] == true);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostHeader(),
        buildPostImages(),
        buildPostFooter(),
      ],
    );
  }
}
