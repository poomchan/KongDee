import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/components/progress_indicators.dart';
import 'package:fluttertaladsod/model/comment.dart';
import 'package:fluttertaladsod/model/post.dart';
import 'package:fluttertaladsod/services/db_service.dart';
import 'package:fluttertaladsod/storage/local_state_storage.dart';
import 'package:provider/provider.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  TextEditingController _commentController = TextEditingController();

  handleUploadComment() {
    Post post =
        Provider.of<LocalStateStorage>(context, listen: false).focusedPost;

    // upload to comment collection
    dbService.uploadComment(context,
        postId: post.postId,
        postOwnerId: post.ownerId,
        text: _commentController.text);

    // upload to activity collection

    _commentController.clear();
  }

  buildCommentView() {
    Post post =
        Provider.of<LocalStateStorage>(context, listen: false).focusedPost;

    // real time getting comments
    return StreamBuilder(
      stream: dbService.postsRef
          .document(post.postId)
          .collection('comments')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return circularProgress(context);
        }

        List<Comment> comments = [];

        snapshot.data.documents.forEach((DocumentSnapshot doc) {
          comments.add(Comment.fromDocument(doc));
        });

        // TODO: build no comment page
        if (comments.isEmpty) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 300.0,
              ),
              Center(child: Text('No comments')),
            ],
          );
        }

        return ListView(
          children: comments,
          shrinkWrap: true,
        );
      },
    );
  }

  buildCommentField() {
    return ListTile(
      title: TextField(
        controller: _commentController,
        autocorrect: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: "Write a comment...",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w300,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      trailing: GestureDetector(
        onTap: handleUploadComment,
        child: Text(
          'Post',
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Comments',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Divider(height: 0.0),
            buildCommentView(),
            Spacer(),
            Divider(height: 10.0),
            buildCommentField(),
            Divider(height: 1.0),
          ],
        ),
      ),
    );
  }
}
