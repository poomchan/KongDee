part of 'store_near_cubit.dart';

@freezed
abstract class StoreNearState with _$StoreNearState {
  const factory StoreNearState.inital() = _Initial;
  const factory StoreNearState.loading(List<Store> previousStoreList) = _Loading;
  const factory StoreNearState.loaded(List<Store> storeList) = _Loaded;
  const factory StoreNearState.failure(StoreFailure f) = _Failure;
}
