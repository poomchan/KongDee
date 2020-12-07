import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_failure.freezed.dart';

@immutable
@freezed
abstract class LocationFailure with _$LocationFailure {
  const factory LocationFailure.cancleByUser() = _CancleByUser;
  const factory LocationFailure.insufficientPermission() =
      _InsufficietPermission;
  const factory LocationFailure.unexpected(dynamic err) = _Unexpected;
}
