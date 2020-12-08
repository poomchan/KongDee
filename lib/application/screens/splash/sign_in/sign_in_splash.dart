import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/bloc/core/view_widget.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/core/theme.dart';
import 'package:fluttertaladsod/application/screens/splash/sign_in/sign_in_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignInSplash extends ViewWidget<SignInBloc> {
  const SignInSplash();

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
                  onPressed: bloc.signInWithGoogle,
                  color: Colors.teal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        'SignIn with Google',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'This is the sign in page',
                  style: kBlackHeaderTextStyle,
                ),
              ),
            ],
          ),
        ),
        GetBuilder<SignInBloc>(
          builder: (b) => b.state.maybeWhen(
            loading: () => Container(
              width: Get.width,
              height: Get.height,
              color: Colors.black45,
              child: Center(
                child: circularProgress(context),
              ),
            ),
            orElse: () => const SizedBox(),
          ),
        ),
      ],
    );
  }
}
