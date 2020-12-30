import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/domain/user/user.dart';
import 'package:get/get.dart';
import 'package:fluttertaladsod/application/routes/router.dart';

class ProfileAvatar extends ViewWidget<AuthBloc> {
  const ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthBloc>(
      builder: (_) => bloc.progress.when(
        inital: () => const SizedBox(),
        loading: () => circularProgress(context),
        loaded: () => _buildProfileAvatar(context),
        failure: () => _buildFailureWidget(context),
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    final isAuth = bloc.isAuth;
    final user = bloc.user;
    return GestureDetector(
      onTap: () => !isAuth
          ? Get.toNamed(Routes.signInSplash)
          : Get.toNamed(Routes.profilePage, arguments: user.id),
      child: Hero(
        tag: user?.photoUrl ?? "",
        child: CircleAvatar(
          backgroundColor:
              isAuth ? Colors.transparent : Theme.of(context).accentColor,
          radius: 30.0,
          backgroundImage: imageProvider(isAuth: isAuth, user: user),
          child: isAuth ? null : Icon(Icons.supervised_user_circle),
        ),
      ),
    );
  }

  ImageProvider<Object> imageProvider({bool isAuth, UserDomain user}) {
    try {
      return isAuth ? CachedNetworkImageProvider(user.photoUrl) : null;
    } catch (err) {
      return NetworkImage('url');
    }
  }

  Widget _buildFailureWidget(BuildContext context) {
    return bloc.failure.when(
      unauthenticated: () => _buildProfileAvatar(context),
      serverError: () => Icon(Icons.error),
      unexpected: (f) => Icon(Icons.error),
      cancleByUser: () => _buildProfileAvatar(context),
    );
  }
}
