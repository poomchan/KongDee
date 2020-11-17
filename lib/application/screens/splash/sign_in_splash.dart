import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/core/theme.dart';
import 'package:fluttertaladsod/application/global_bloc/auth/actor/auth_actor_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthActorCubit, AuthActorState>(
      listener: (context, state) {
        state.maybeMap(
            success: (_) => ExtendedNavigator.of(context).pop(), orElse: () {});
      },
      builder: (context, state) => Stack(
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
                      BlocProvider.of<AuthActorCubit>(context)
                          .signInWithGoogle();
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
          state.maybeMap(
              loading: (_) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black45,
                    child: Center(
                      child: circularProgress(context),
                    ),
                  ),
              orElse: () => Container()),
        ],
      ),
    );
  }
}
