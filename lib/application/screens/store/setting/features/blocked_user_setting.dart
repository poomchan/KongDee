import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/setting/bloc/blocked_users_bloc.dart';
import 'package:fluttertaladsod/domain/auth/user/user.dart';
import 'package:get/get.dart';

class BlockedUsersSettingPage extends ViewWidget<BlockedUsersSettingBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blocked Users')),
      body: GetBuilder<BlockedUsersSettingBloc>(
        builder: (bloc) => bloc.progress.when(
          inital: () => Text('init state'),
          loading: () => circularProgress(),
          loaded: () => GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 3,
              childAspectRatio: 0.9,
            ),
            itemCount: bloc.blockedUserList.length,
            itemBuilder: (context, indx) =>
                _buildUserCard(bloc.blockedUserList[indx]),
          ),
          failure: () => Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _buildUserCard(UserDomain user) {
    return GestureDetector(
      onTap: () => bloc.onUserTapped(user),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(user.photoUrl),
                radius: 30.0,
              ),
              const SizedBox(height: 20),
              Text(user.displayName),
              const SizedBox(height: 10),
              if (bloc.isThisUserBlocked(user))
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  height: 20,
                  width: 70,
                  child: const Text(
                    'blocked',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
