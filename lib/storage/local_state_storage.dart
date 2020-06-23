import 'package:flutter/cupertino.dart';
import 'package:fluttertaladsod/model/post.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class LocalStateStorage extends ChangeNotifier {
  // use when user changing the profile picture
  List<Post> _profilePosts;
  // use when user creating a new post
  List<Asset> _postingImages;
  // use when showing comments
  Post _focusedPost;

  clear() {
    this._profilePosts = null;
    this._postingImages = null;
    this._focusedPost = null;
  }

  Post get focusedPost => this._focusedPost;

  List<Asset> get postingImages => this._postingImages;

  List<Post> get profilePost => this._profilePosts;

  setFocusingPost(Post post) {
    this._focusedPost = post;
  }

  setPostingImages(List<Asset> images) {
    this._postingImages = images;
    notifyListeners();
    print('images set');
  }

  setProfilePost(List<Post> posts) {
    this._profilePosts = posts;
    notifyListeners();
  }
}
