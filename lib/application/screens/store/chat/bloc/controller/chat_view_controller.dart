import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatViewController extends GetxController {

  final _scrollController = ScrollController().obs;

  ScrollController get scrollController => _scrollController.value;

}
