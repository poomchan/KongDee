import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/input_bar.dart';
import 'package:fluttertaladsod/application/screens/store/chat/widgets/message_view.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('chat')),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Column(
            children: const [
              MessageView(),
              Divider(height: 0),
              InputBar(),
            ],
          ),
        ),
      ),
    );
  }
}
