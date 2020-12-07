import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ViewWidget<T> extends StatelessWidget {
  const ViewWidget({Key key}) : super(key: key);

  final String tag = null;

  T get bloc => Get.find<T>(tag: tag);

  @override
  Widget build(BuildContext context);
}