import 'package:dartz/dartz.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:get/get.dart';

class NoStoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 100 / 30,
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.storeForm, arguments: none()),
        child: DottedBorder(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(5.0),
          strokeWidth: 2,
          dashPattern: const [10, 5],
          borderType: BorderType.RRect,
          radius: Radius.circular(10.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0)),
            child: Text("Opps! No store, Let's create one!"),
          ),
        ),
      ),
    );
  }
}
