part of 'owned_store_watcher_cubit.dart';

@freezed
abstract class OwnedStoreWatcherState with _$OwnedStoreWatcherState {
  const factory OwnedStoreWatcherState.inital() = _Initial;
  const factory OwnedStoreWatcherState.loadInProgress() = _LoadInProgress;
  const factory OwnedStoreWatcherState.loadSuccess(Store store) = _LoadSuccess;
  const factory OwnedStoreWatcherState.loadFailure(StoreFailure f) =
      _Loadfailure;
}
