import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/presentation/core/theme.dart';
import 'package:fluttertaladsod/presentation/routes/router.gr.dart';

class NoStoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 100 / 30,
      child: GestureDetector(
        onTap: () {
          ExtendedNavigator.of(context).push(Routes.storeForm,
              arguments: StoreFormArguments(initialStore: none()));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: tBoxShadowGlobal,
          ),
          child: Center(
            child: Text("Opps! No store, Let's create one!"),
          ),
        ),
      ),
    );
  }
}
