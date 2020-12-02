



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputBarController extends GetxController {
  final _textEditingController = Rx<TextEditingController>();

  TextEditingController get textController => _textEditingController.value;
  

}