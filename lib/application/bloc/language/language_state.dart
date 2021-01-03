import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_state.freezed.dart';

@immutable
@freezed
abstract class LanguageState with _$LanguageState {
  const factory LanguageState({
    @Default(false) bool isThai,
    @Default(false) bool isEnglishUS,
  }) = _LanguageState;
}
