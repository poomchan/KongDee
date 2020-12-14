

import 'package:get/get.dart';

import 'action/action_bloc.dart';
import 'input_bar/input_bar_bloc.dart';
import 'message_view/message_view_bloc.dart';


class ChatPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputBarBloc());
    Get.lazyPut(() => MessageViewBloc());
    Get.lazyPut(() => ActionBloc(), fenix: true);
  }

}