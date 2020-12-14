import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_state.freezed.dart';

@freezed
abstract class ActionState with _$ActionState {
  const factory ActionState.inital() = _Initial;
  const factory ActionState.loading() = _Loading;
  const factory ActionState.loaded() = _Loaded;
  const factory ActionState.failure() = _Failure;
}
