part of 'store_prefs_actor_cubit.dart';

@freezed
abstract class StorePrefsActorState with _$StorePrefsActorState {
  const factory StorePrefsActorState.initial() = _Initial;
  const factory StorePrefsActorState.loading() = _Loading;
  const factory StorePrefsActorState.success() = _Success;
  const factory StorePrefsActorState.failure(StoreFailure f) = _Failure;
}
