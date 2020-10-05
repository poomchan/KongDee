import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_failures.freezed.dart';

@immutable
@freezed
abstract class LocationFailures with _$LocationFailures {
  const factory LocationFailures.cancleByUser() = _CancleByUser;
  const factory LocationFailures.insufficientPermission() =
      _InsufficietPermission;
}
