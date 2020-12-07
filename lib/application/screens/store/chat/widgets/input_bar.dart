import 'package:flutter/material.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/form/chat_form_bloc.dart';
import 'package:get/get.dart';

class InputBar extends StatelessWidget {
  const InputBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatFormBloc>(
      builder: (bloc) => Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: bloc.textController,
                textCapitalization: TextCapitalization.sentences,
                minLines: 1,
                maxLines: 5,
                decoration:
                    InputDecoration.collapsed(hintText: 'send a message...'),
                onChanged: (val) => bloc.bodyChanged(val),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              iconSize: 25.0,
              onPressed: () => bloc.uploadChat(),
            ),
            const SizedBox(width: 10.0)
          ],
        ),
      ),
    );
  }
}
