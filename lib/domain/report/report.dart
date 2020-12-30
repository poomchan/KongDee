// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_objects.dart';

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
