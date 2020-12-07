

import 'package:fluttertaladsod/application/screens/store/chat/bloc/watcher/store_chat_watcher_cubit.dart';
import 'package:get/get.dart';

import 'form/chat_form_bloc.dart';

class ChatPB extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatFormBloc());
    Get.lazyPut(() => StoreChatWatcherBloc());
  }

}