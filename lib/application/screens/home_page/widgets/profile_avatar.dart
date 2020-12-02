import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/global_bloc/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/application/routes/router.gr.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:get/get.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthWatcherCubit, AuthWatcherState>(
      cubit: Get.find<AuthWatcherCubit>(),
      builder: (_, state) => state.map(
        inital: (s) => null,
        loading: (s) => circularProgress(context),
        authenticated: (s) =>
            _buildProfileAvatar(context, isAuth: true, user: s.user),
        unAuthenticated: (s) => _buildProfileAvatar(context, isAuth: false),
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context,
      {@required bool isAuth, UserDomain user}) {
    return GestureDetector(
      onTap: () => !isAuth
          ? ExtendedNavigator.of(context).pushSignInSplash()
          : ExtendedNavigator.of(context).pushProfilePage(user: user),
      child: Hero(
        tag: user?.photoURL ?? "",
        child: CircleAvatar(
          backgroundColor:
              isAuth ? Colors.transparent : Theme.of(context).accentColor,
          radius: 30.0,
          backgroundImage:
              isAuth ? CachedNetworkImageProvider(user.photoURL) : null,
          child: isAuth ? null : Icon(Icons.supervised_user_circle),
        ),
      ),
    );
  }
}
