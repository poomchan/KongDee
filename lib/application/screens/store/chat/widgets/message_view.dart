import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertaladsod/application/core/components/progress_indicator.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/watcher/store_chat_watcher_cubit.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/day_card.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/message.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/message.dart';

class MessageView extends HookWidget {
  final UniqueId storeId;
  const MessageView({
    Key key,
    @required this.storeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = useScrollController();
    return Expanded(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<StoreChatWatcherCubit, StoreChatWatcherState>(
            builder: (context, state) => state.map(
              inital: (state) => circularProgress(context),
              failure: (state) => Icon(Icons.error),
              loading: (state) => circularProgress(context),
              loaded: (state) => NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollEndNotification &&
                      _scrollController.position.extentAfter == 0) {
                    context
                        .bloc<StoreChatWatcherCubit>()
                        .fetchMoreChat(storeId);
                  }
                  return null;
                },
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: state.chatList.length,
                  itemBuilder: (context, index) =>
                      _buildMessage(state.chatList, index),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessage(List<MessageDomain> messages, int index) {
    final m = messages[index];
    return Column(
      children: [
        index == messages.length - 1
            ? const SizedBox(height: 0)
            : m.timestamp.toDate().weekday !=
                    messages[index + 1].timestamp.toDate().weekday
                ? DayCard(dateTime: m.timestamp.toDate())
                : const SizedBox(height: 0),
        Message(
          text: m.body.getOrCrash(),
          isSender: m.isSender,
          avatarUrl: m.senderAvatarUrl.getOrCrash(),
          isTop: index == messages.length - 1
              ? true
              : m.senderId != messages[index + 1].senderId,
          senderName: m.senderName.getOrCrash(),
          timestamp: m.timestamp,
        ),
      ],
    );
  }
}
