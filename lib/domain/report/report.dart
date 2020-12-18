import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';

@immutable
@freezed
abstract class Report with _$Report {
  const factory Report.user({
    @required UniqueId userId,
    @required UniqueId reporter,
    @required String description,
  }) = _User;
  const factory Report.store({
    @required UniqueId storeId,
    @required UniqueId reporter,
    @required String description,
  }) = _Store;

}
