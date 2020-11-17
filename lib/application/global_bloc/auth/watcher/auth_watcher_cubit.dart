import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_watcher_state.dart';
part 'auth_watcher_cubit.freezed.dart';

@injectable
class AuthWatcherCubit extends Cubit<AuthWatcherState> {
  final IAuthFacade _iAuthFacade;
  StreamSubscription userSubscription;

  AuthWatcherCubit(this._iAuthFacade) : super(_Initial());

  Future<void> watchUser() async {
    emit(AuthWatcherState.loading());
    final userOptionStream = _iAuthFacade.watchSignedInUser();
    userSubscription = userOptionStream.listen((Option<UserDomain> userOption) {
      return userOption.fold(
        () => emit(AuthWatcherState.unAuthenticated()),
        (UserDomain user) => emit(
          AuthWatcherState.authenticated(user),
        ),
      );
    });
  }

  @override
  Future<void> close() {
    userSubscription.cancel();
    return super.close();
  }
}
