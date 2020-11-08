import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_own_watcher/owned_store_watcher_cubit.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/core/components/buttom_sheet.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/owned_store_view.dart';

class ProfilePage extends StatelessWidget implements AutoRouteWrapper {
  final UserDomain user;

  const ProfilePage({Key key, @required this.user}) : super(key: key);
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OwnedStoreWatcherCubit>(
          create: (context) {
            return getIt<OwnedStoreWatcherCubit>()
              ..watchOwnedStoreStarted(ownerId: user.id);
          },
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 10.0),
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              showAppButtomSheet(
                context,
                children: [
                  ButtomSheetItem(
                    title: 'Report user',
                    icon: FontAwesomeIcons.flag,
                    textColor: Colors.redAccent,
                    onTap: () => print('report user'),
                  ),
                  Divider(height: 0.0, color: Colors.white24),
                  ButtomSheetItem(
                    title: 'Block user',
                    icon: FontAwesomeIcons.ban,
                    textColor: Colors.redAccent,
                    onTap: () => print('blocking user'),
                  ),
                  Divider(height: 0.0, color: Colors.white24),
                ],
              );
            },
          ),
          IconButton(
            padding: const EdgeInsets.only(right: 10.0),
            icon: Icon(Icons.settings),
            onPressed: () => context.navigator.pushProfileSettingPage(),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: kToolbarHeight / 3,
              ),
              Center(
                child: Hero(
                  tag: user.photoURL,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        color: Colors.black26,
                      ),
                    ], borderRadius: BorderRadius.circular(60.0)),
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage:
                          CachedNetworkImageProvider(user.photoURL),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                user.displayName,
                style: TextStyle()
                    .copyWith(fontSize: 20.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                child: Text('Basic'),
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
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
                children: [
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
