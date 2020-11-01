import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/chat/form/chat_form_cubit.dart';
import 'package:fluttertaladsod/application/store/chat/watcher/store_chat_watcher_cubit.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:fluttertaladsod/presentation/screens/store/chat/widgets/input_bar.dart';
import 'package:fluttertaladsod/presentation/screens/store/chat/widgets/message_view.dart';

class ChatPage extends StatelessWidget {
  final UniqueId storeId;

  const ChatPage({Key key, this.storeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StoreChatWatcherCubit>(
          create: (context) =>
              getIt<StoreChatWatcherCubit>()..watchStarted(storeId),
        ),
        BlocProvider<ChatFormCubit>(
          create: (context) => getIt<ChatFormCubit>(),
        ),
      ],
      child: ChatScaffold(
        storeId: storeId,
      ),
    );
  }
}

class ChatScaffold extends StatelessWidget {
  final UniqueId storeId;

  const ChatScaffold({Key key, this.storeId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chat')),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              MessageView(storeId: storeId),
              Divider(height: 0,),
              InputBar(storeId: storeId),
            ],
          ),
        ),
      ),
    );
  }
}
