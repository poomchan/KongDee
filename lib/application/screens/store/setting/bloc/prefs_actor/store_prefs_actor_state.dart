part of 'store_prefs_actor_cubit.dart';

@freezed
abstract class StorePrefsActorState with _$StorePrefsActorState {
  const factory StorePrefsActorState.initial() = _Initial;
  const factory StorePrefsActorState.loading() = _Loading;
  const factory StorePrefsActorState.loaded() = _Loaded;
  const factory StorePrefsActorState.failure() = _Failure;
}
