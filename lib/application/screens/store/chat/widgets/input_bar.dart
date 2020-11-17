import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/screens/store/chat/bloc/form/chat_form_cubit.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';

class InputBar extends StatefulWidget {
  final UniqueId storeId;

  const InputBar({Key key, this.storeId}) : super(key: key);
  @override
  _InputBarState createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  TextEditingController _textEditingController;
  String inputText;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formBloc = BlocProvider.of<ChatFormCubit>(context);
    return BlocListener<ChatFormCubit, ChatFormState>(
      listenWhen: (p, c) => p.isUploading != c.isUploading,
      listener: (context, state) {
        if (state.chat.body.value.isLeft()) {
          _textEditingController.text = '';
        }
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                  controller: _textEditingController,
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration.collapsed(
                    hintText: 'send a message...',
                  ),
                  onChanged: (val) => formBloc.bodyChanged(val)),
            ),
            IconButton(
              icon: Icon(Icons.send),
              iconSize: 25.0,
              onPressed: () => formBloc.uploadChat(
                storeId: widget.storeId,
              ),
            ),
            SizedBox(width: 10.0,)
          ],
        ),
      ),
    );
  }
}
