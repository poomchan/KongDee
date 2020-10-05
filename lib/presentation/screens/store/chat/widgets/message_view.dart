import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/chat/watcher/store_chat_watcher_cubit.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/presentation/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/presentation/screens/store/chat/widgets/message.dart';

class MessageView extends StatelessWidget {
  final UniqueId storeId;
  const MessageView({
    Key key,
    @required this.storeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<StoreChatWatcherCubit, StoreChatWatcherState>(
        builder: (context, state) => state.maybeMap(
          inital: (state) => circularProgress(context),
          failure: (state) => Icon(Icons.error),
          orElse: () => NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (state.maybeMap(
                    loaded: (state) => true,
                    orElse: () => false,
                  ) &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                context.bloc<StoreChatWatcherCubit>().fetchMoreChat(storeId);
              }
              return null;
            },
            child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: state.maybeMap(
                    loading: (state) => [
                          ..._buildMessage(state.previousChatList),
                          circularProgress(context),
                        ],
                    loaded: (state) => _buildMessage(state.chatList),
                    orElse: () => [Container()])),
          ),
        ),
      ),
    );
  }

  List<Message> _buildMessage(List<MessageDomain> messages) {
    final List<Message> messageList = [];
    String senderId = 'fake first id';

    for (final message in messages) {
      messageList.add(
        Message(
          text: message.body.getOrCrash(),
          isSender: message.isSender,
          avatarUrl: message.senderAvatarUrl.getOrCrash(),
          isTop: message.senderId.getOrCrash() != senderId,
          senderName: message.senderName.getOrCrash(),
          timestamp: message.timestamp
        ),
      );
      // set new sender id
      senderId = message.senderId.getOrCrash();
    }

    return messageList.reversed.toList();
  }
}
