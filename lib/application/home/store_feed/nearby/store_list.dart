import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_list.freezed.dart';

@immutable
@freezed
abstract class StoreList implements _$StoreList {
  const factory StoreList({
    @required List<Store> value,
  }) = _StoreList;

  factory StoreList.empty() => StoreList(value: const []);

  factory StoreList.fromList(List<Store> list) => StoreList(value: list);



  const StoreList._();
}
