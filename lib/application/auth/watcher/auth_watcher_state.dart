part of 'auth_watcher_cubit.dart';

@freezed
abstract class AuthWatcherState with _$AuthWatcherState {
  const factory AuthWatcherState.inital() = _Initial;
  const factory AuthWatcherState.loading() = _Loading;
  const factory AuthWatcherState.authenticated(UserDomain user) =
      _Authenticated;
  const factory AuthWatcherState.unAuthenticated() = _UnAuthenticated;
}
