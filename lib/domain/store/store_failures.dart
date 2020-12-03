import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_failures.freezed.dart';

@immutable
@freezed
abstract class StoreFailure with _$StoreFailure {
  const factory StoreFailure.noStore() = _NoStoreOwned;
  const factory StoreFailure.unexpected(detail) = _Unexpected;
  const factory StoreFailure.locationNotGranted() = _LocationNotGranted;
  const factory StoreFailure.timeout() = _Timeout;

}
