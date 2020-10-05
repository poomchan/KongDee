part of 'store_view_cubit.dart';

@freezed
abstract class StoreViewState with _$StoreViewState {
  const factory StoreViewState.inital() = _Initial;
  const factory StoreViewState.loading() = _Loading;
  const factory StoreViewState.success(Store store) = _Success;
  const factory StoreViewState.failure(StoreFailure f) = _Failure;
}
