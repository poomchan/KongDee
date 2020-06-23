import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String displayName;
  final String bio;
  final String email;
  final String photoURL;

  User({this.id, this.displayName, this.bio, this.email, this.photoURL});

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc['id'],
      displayName: doc['displayName'],
      bio: doc['bio'],
      email: doc['email'],
      photoURL: doc['photoUrl'],
    );
  }
}
