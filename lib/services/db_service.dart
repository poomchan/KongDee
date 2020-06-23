import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/storage/local_state_storage.dart';
import 'package:fluttertaladsod/model/post.dart';
import 'package:fluttertaladsod/model/user.dart';
import 'package:fluttertaladsod/services/image_service.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class DBService {
  final Firestore _db = Firestore.instance;
  final CollectionReference _userRef = Firestore.instance.collection('users');
  final CollectionReference _postsRef =
      Firestore.instance.collection('posts').reference();
  final StorageReference _storageRef = FirebaseStorage.instance.ref();
  User _currentUser;

  DocumentReference get currentUserRef {
    return _userRef.document(_currentUser.id);
  }

  CollectionReference get postsRef {
    return _postsRef;
  }

  CollectionReference get userRef {
    return _db.collection('users');
  }

  fetchAppState(BuildContext context) {
    fetchProfilePostsFromFirestore(context, userId: _currentUser?.id);
  }

  fetchUserDataFromFirestore(BuildContext context, String id) async {
    print('fetching user data from Firestore');

    Stream<DocumentSnapshot> _userStream = _userRef
        .document(id)
        .snapshots(includeMetadataChanges: false)
        .asBroadcastStream();

    _userStream.listen((DocumentSnapshot doc) {
      User currentUser = User.fromDocument(doc);
      _currentUser = currentUser;

      Provider.of<NetworkStateStorage>(context, listen: false)
          .setCurrentUser(_currentUser);
    });
  }

  fetchProfilePostsFromFirestore(BuildContext context,
      {@required String userId}) async {
    // get posts corresponding to user profile
    QuerySnapshot snapshot = await _postsRef
        .where('ownerId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .getDocuments();

    List<Post> myPosts = snapshot.documents
        .map((DocumentSnapshot doc) => Post.fromDocument(doc))
        .toList();

    Provider.of<LocalStateStorage>(context, listen: false)
        .setProfilePost(myPosts);
  }

  updateUserInFireStore(BuildContext context,
      {String newUserName, String newUserBio, File image}) async {
    String mediaUrl;

    // if user change profile picture
    if (image != null) {
      // compress
      File compressedImage = await imageService.compressImage(context, image);

      // upload to storage
      mediaUrl = await uploadFileImage(
        fileImage: compressedImage,
      );
    }

    // update to Firestore
    bool _userDidChangeProfileImage = mediaUrl != null;
    DocumentReference docRef = _userRef.document(_currentUser.id);
    docRef.updateData({
      'displayName': newUserName,
      'bio': newUserBio,
      'photoUrl': _userDidChangeProfileImage ? mediaUrl : _currentUser.photoURL,
    }).then((result) {
      print('successfully update profile');
    }).catchError((err) => print(err));
  }

  uploadPostInFirestore({
    @required String postId,
    @required List<String> mediaUrl,
    @required String caption,
    @required String category,
    @required String formattedLocation,
    @required Map<String, Object> geoPoint,
  }) {
    DocumentReference docRef = _postsRef.document(postId);

    docRef.setData({
      'ownerId': _currentUser.id,
      'ownerName': _currentUser.displayName,
      'mediaUrls': mediaUrl,
      'caption': caption,
      'category': category,
      'formattedLocation': formattedLocation,
      'geoPoint': geoPoint,
      'timestamp': DateTime.now(),
      'likes': {'uerId': false},
      'postId': postId,
    }).catchError((err) => print(err));
    print('successfully upload post to Firestore');
  }

  // @ image must be compressed already
  // this function returns the media downloadUrl
  Future<String> uploadFileImage({
    @required File fileImage,
  }) async {
    // generate a unique image id
    String imageId = Uuid().v4();

    // upload (path in firebase storage)
    StorageUploadTask uploadTask = _storageRef
        .child("user/user_${_currentUser.id}/profile/img_$imageId")
        .putFile(fileImage);

    // wait for completion
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;

    //get download Url
    String mediaUrl = await storageSnap.ref.getDownloadURL();
    return mediaUrl;
  }

  // return the media downloadUrl
  Future<String> uploadAssetImage({
    @required Asset assetImage,
    @required String postId,
  }) async {
    // generate a unique image id
    String imageId = Uuid().v4();

    // can compress (de-quality) image here
    print('compressing');
    ByteData byteData = await assetImage.getByteData(quality: 1);
    List<int> imageData = byteData.buffer.asUint8List();

    // upload with the specific firebase storage path
    print('uploading');
    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("user/user_${_currentUser.id}/posts/post_$postId/img_$imageId");
    StorageUploadTask uploadTask = ref.putData(imageData);

    // wait for completion
    StorageTaskSnapshot storageSnap = await uploadTask.onComplete;

    //get download Url
    String mediaUrl = await storageSnap.ref.getDownloadURL();
    print('success');
    return mediaUrl;
  }

  uploadActivity({
    @required String type,
    @required userId,
    String text,
    String previewUrl,
  }) {
    User currentUser = _currentUser;

    String activityId = Uuid().v4();

    CollectionReference activityRef =
        _userRef.document(userId).collection('activity');

    bool isPostOwner = currentUser.id == userId;
    // do not notify if the comment is written by the owner
    if (isPostOwner) {
      return;
    }

    activityRef.document(activityId).setData({
      'activityId': activityId,
      'ownerId': currentUser.id,
      'ownerAvatarUrl': currentUser.photoURL,
      'ownerName': currentUser.displayName,
      'text': text,
      'timestamp': DateTime.now(),
      'mediaPreviewUrl': previewUrl,
      'type': type
    });
  }

  uploadComment(BuildContext context,
      {@required postId, @required text, @required String postOwnerId}) {
    Post post =
        Provider.of<LocalStateStorage>(context, listen: false).focusedPost;

    String commentId = Uuid().v4();

    User currentUser =
        Provider.of<NetworkStateStorage>(context, listen: false).currentUser;

    CollectionReference commentRef =
        _postsRef.document(postId).collection('comments');

    // create the comment in "comment" collection
    commentRef
        .document(commentId)
        .setData({
          'commentId': commentId,
          'ownerId': currentUser.id,
          'text': text,
          'ownerAvatar': currentUser.photoURL,
          'ownerName': currentUser.displayName,
          'timestamp': DateTime.now(),
        })
        .catchError((err) => print(err))
        .whenComplete(() => print('successfully upload comment'));

    // create the comment in "activity" collection
    uploadActivity(
        type: 'comment',
        userId: postOwnerId,
        text: text,
        previewUrl: post.mediaUrls[0]);
  }
}

DBService dbService = DBService();
