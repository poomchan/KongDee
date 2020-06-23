import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/components/back_button.dart';
import 'package:fluttertaladsod/components/pick_image_dialog.dart';
import 'package:fluttertaladsod/components/progress_indicators.dart';
import 'package:fluttertaladsod/constant.dart';
import 'package:fluttertaladsod/storage/network_state_storage.dart';
import 'package:fluttertaladsod/model/user.dart';
import 'package:fluttertaladsod/services/auth_service.dart';
import 'package:fluttertaladsod/services/db_service.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File image;
  String userName;
  String userBio;
  String userId;
  bool isUpdatingData = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  setUserInfoState(user) async {
    userName = user.displayName;
    userBio = user.bio;
    userId = user.id;
  }

  buildNameField() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Display Name',
            style: TextStyle(fontSize: 17.0, color: Colors.black54),
          ),
          TextFormField(
            initialValue: userName,
            decoration: InputDecoration(hintText: 'Update name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some name';
              }
              if (value.trim().length < 3) {
                return 'Name is too short';
              }
              if (value.trim().length > 20) {
                return 'Name is too long';
              }
              return null;
            },
            onSaved: (value) {
              setState(
                () {
                  userName = value;
                },
              );
            },
            autovalidate: true,
          ),
        ],
      ),
    );
  }

  buildBioField() {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bio',
            style: TextStyle(fontSize: 17.0, color: Colors.black54),
          ),
          TextFormField(
            initialValue: userBio,
            decoration: InputDecoration(
              hintText: 'Update bio',
            ),
            validator: (value) {
              if (value.trim().length > 100) {
                return 'Bio is too long';
              }
              return null;
            },
            onSaved: (value) {
              setState(
                () {
                  userBio = value;
                },
              );
            },
            autovalidate: true,
            maxLines: 4,
          ),
        ],
      ),
    );
  }

  updateProfileInfo() async {
    setState(() {
      isUpdatingData = true;
    });

    // validating the input
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      // updating to Firestore
      await dbService.updateUserInFireStore(context,
          newUserBio: this.userBio,
          newUserName: this.userName,
          image: this.image);
      // TODO: Handle when update is unsuccessful

      // show snackBar
      final SnackBar snackBar = SnackBar(
        content: Text('Profile Updated'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);

      Timer(
        Duration(milliseconds: 2000),
        () => Navigator.pop(context),
      );
    }

    setState(() {
      isUpdatingData = false;
    });
  }

  buildSaveButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
      child: FlatButton(
        onPressed: isUpdatingData ? null : () => updateProfileInfo(),
        color: Theme.of(context).primaryColor,
        child: Text(
          'Update Profile',
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        disabledColor: Colors.grey,
      ),
    );
  }

  buildLogOutButton() {
    return FlatButton.icon(
      onPressed: () {
        authService.logout(context);
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.cancel,
        color: Colors.red,
      ),
      label: Text(
        'Log Out',
        style: TextStyle(color: Colors.red, fontSize: 15.0),
      ),
    );
  }

  getImage() {
    showDialog(
      context: context,
      builder: (context) => PickImageDialog(
        onGetImage: (image) {
          setState(() {
            this.image = image;
          });
        },
      ),
    );
  }

  buildCircleAvatar(User user) {
    if (user == null) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: GestureDetector(
          onTap: isUpdatingData ? null : getImage,
          child: CircleAvatar(
            radius: 100.0,
            backgroundColor: Colors.white70,
            backgroundImage: image != null
                ? FileImage(image)
                : CachedNetworkImageProvider(
                    user?.photoURL ?? "https://via.placeholder.com/150"),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 40.0,
                width: double.infinity,
                color: Colors.black54,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.edit,
                        color: Colors.white70,
                        size: 20.0,
                      ),
                      Text(
                        'edit',
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<NetworkStateStorage>(context).currentUser;
    setUserInfoState(user);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: kBeautifulBlackColor),
        ),
        automaticallyImplyLeading: false,
        leading: MyBackButton(),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              isUpdatingData ? linearProgress(context) : Container(),
              buildCircleAvatar(user),
              SizedBox(
                height: 10.0,
              ),
              buildNameField(),
              buildBioField(),
              buildSaveButton(),
              buildLogOutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
