// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_failures.freezed.dart';

@immutable
@freezed
abstract class StoreFailure with _$StoreFailure {
  const factory StoreFailure.locationNotGranted() = _LocationNotGranted;
  const factory StoreFailure.noStore() = _NoStore;
  const factory StoreFailure.timeout() = _Timeout;
  const factory StoreFailure.unexpected(dynamic err) = _Unexpected;

}
