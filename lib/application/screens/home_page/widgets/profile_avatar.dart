import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:get/get.dart';
import 'package:fluttertaladsod/application/routes/router.dart';

class ProfileAvatar extends ViewWidget<AuthBloc> {
  const ProfileAvatar();
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthBloc>(
      builder: (_) => bloc.state.when(
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
          : Get.toNamed(Routes.profilePage, arguments: user),
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

  Widget _buildFailureWidget(BuildContext context) {
    return bloc.failure.when(
      unauthenticated: () => _buildProfileAvatar(context),
      serverError: () => Icon(Icons.error),
    );
  }
}
