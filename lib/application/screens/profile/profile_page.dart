import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/screens/profile/bloc/profile_bloc.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:get/get.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'widgets/owned_store_view.dart';

class ProfilePage extends ViewWidget<ProfileBloc> {
  final UserDomain user;

  const ProfilePage({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    final screenHeight = Get.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10.0),
            icon: const Icon(Icons.more_horiz),
            onPressed: bloc.showDiaglog,
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 10.0),
            icon: Icon(Icons.settings),
            onPressed: () => Get.toNamed(Routes.profileSettingPage),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: kToolbarHeight / 3),
              Center(
                child: Hero(
                  tag: user.photoUrl,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                          color: Colors.black26,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage:
                          CachedNetworkImageProvider(user.photoUrl),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                user.displayName,
                style: TextStyle()
                    .copyWith(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                child: const Text('Basic'),
              ),
              SizedBox(height: screenHeight * 0.07),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: screenWidth,
              height: screenHeight * 0.55,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 30.0,
                    spreadRadius: 1.0,
                    color: Colors.black12,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: const [
                  OwnedStoreView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
