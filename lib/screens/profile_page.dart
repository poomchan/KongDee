import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/components/post_tile.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/storage/local_state_storage.dart';
import 'package:fluttertaladsod/model/post.dart';

import 'package:fluttertaladsod/model/user.dart';
import 'package:fluttertaladsod/components/progress_indicators.dart';
import 'package:fluttertaladsod/services/db_service.dart';
import 'package:fluttertaladsod/screens/edit_profile_page.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final userId;

  ProfilePage(this.userId);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //TODO: refresh the app state (when drag refresh?)
  @override
  initState() {
    super.initState();
  }

  buildButton(BuildContext context, {String text, Function function}) {
    return Container(
      width: 200.0,
      padding: EdgeInsets.only(top: 2.0),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: function,
      ),
    );
  }

  buildProfileButton(BuildContext context) {
    // viewing own profile - show edit profile button
    User currentUser = Provider.of<NetworkStateStorage>(context).currentUser;
    bool isProfileOwner = currentUser.id == widget.userId;
    showEditProfilePage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EditProfilePage()));
    }

    if (isProfileOwner) {
      return buildButton(context,
          text: 'Edit Profile', function: showEditProfilePage);
    }
  }

  buildProfileHeader(BuildContext context) {
    return FutureBuilder(
      future: dbService.userRef.document(widget.userId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress(context);
        }
        User profileUser = User.fromDocument(snapshot.data);
        return Align(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 48.0,
                backgroundColor: Colors.white54,
                backgroundImage: CachedNetworkImageProvider(
                  profileUser.photoURL ?? 'https://via.placeholder.com/150',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                profileUser.displayName,
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
              ),
              Text(
                profileUser.email,
                style: TextStyle(color: Colors.black54),
              ),
              profileUser.bio != ""
                  ? Text(
                      profileUser.bio,
                    )
                  : Container(),
              buildProfileButton(context),
            ],
          ),
        );
      },
    );
  }

//  buildProfileButton(BuildContext context) {}
  buildProfilePost(bool isFetchingPost, List<Post> postList) {
    if (isFetchingPost) {
      return circularProgress(context);
    } else if (postList.isEmpty) {
      // TODO: build more beautiful no post place holder
      return Center(child: Text('No posts'));
    }

    List<GridTile> gridTiles = [];
    int postIndex = 0;
    postList.forEach((Post post) {
      gridTiles.add(GridTile(
        child: PostTile(post: post, postList: postList, postIndex: postIndex),
      ));
      postIndex++;
    });
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.5,
      crossAxisSpacing: 1.5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: gridTiles,
    );
  }

  Future<void> handleRefreshPage() async {
    dbService.fetchAppState(context);
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  @override
  Widget build(BuildContext context) {
    List<Post> postList = Provider.of<LocalStateStorage>(context).profilePost;
    bool isFetchingPost = postList == null;
    return RefreshIndicator(
      onRefresh: handleRefreshPage,
      displacement: 5.0,
      strokeWidth: 3.0,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          buildProfileHeader(context),
          const Divider(
            height: 0.0,
          ),
          buildProfilePost(isFetchingPost, postList),
        ],
      ),
    );
  }
}
