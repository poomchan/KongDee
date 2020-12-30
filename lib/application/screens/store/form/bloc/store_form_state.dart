import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_form_state.freezed.dart';

@immutable
@freezed
abstract class StoreFormState with _$StoreFormState {
  const factory StoreFormState({
    @required bool isCreating,
    @required Option<Store> initStoreOption,
    @required Either<File, String> banner,
    @required List<Either<File, String>> pics,
  }) = _StoreFormState;

  factory StoreFormState.initial() => StoreFormState(
        initStoreOption: none(),
        isCreating: true,
        banner: right(''),
        pics: [],
      );
}
