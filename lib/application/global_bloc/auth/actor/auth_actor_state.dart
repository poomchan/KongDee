part of 'auth_actor_cubit.dart';

@freezed
abstract class AuthActorState with _$AuthActorState {
  const factory AuthActorState.inital() = _Initial;
  const factory AuthActorState.loading() = _Loading;
  const factory AuthActorState.success() = _Success;
  const factory AuthActorState.failue() = _Failure;
}
