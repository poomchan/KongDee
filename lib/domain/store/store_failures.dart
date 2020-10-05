import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_failures.freezed.dart';

@immutable
@freezed
abstract class StoreFailure with _$StoreFailure {
  const factory StoreFailure.noStore() = _NoStoreOwned;
  const factory StoreFailure.unexpected() = _Unexpected;
}
