import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/auth/auth_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/core/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignInSplash extends StatelessWidget {
  final actorBloc = Get.find<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 40.0),
                child: FlatButton(
                  padding: EdgeInsets.all(10.0),
                  onPressed: () {
                    actorBloc.signInWithGoogle();
                  },
                  color: Colors.teal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          'SignIn with Google',
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                ),
              ),
              Center(
                child: Text(
                  'This is the sign in page',
                  style: kBlackHeaderTextStyle,
                ),
              ),
            ],
          ),
        ),
        _buildRxOverlay(context),
      ],
    );
  }

  Widget _buildRxOverlay(BuildContext context) {
    return GetBuilder<AuthBloc>(
      builder: (b) => b.state.maybeWhen(
          loading: () => Container(
                width: Get.width,
                height: Get.height,
                color: Colors.black45,
                child: Center(
                  child: circularProgress(context),
                ),
              ),
          orElse: () => const SizedBox()),
    );
  }
}
