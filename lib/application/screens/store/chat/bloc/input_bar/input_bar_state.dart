import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/chat/chat_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_bar_state.freezed.dart';

@freezed
abstract class InputBarState with _$InputBarState {
  const factory InputBarState({
    @required bool isUploading,
    @required bool showErrorMessage,
  }) = _InputBarState;

  factory InputBarState.inital() => InputBarState(
        isUploading: false,
        showErrorMessage: false,
      );
}
