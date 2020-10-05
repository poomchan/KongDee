import 'package:bloc/bloc.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_actor_cubit.freezed.dart';
part 'auth_actor_state.dart';

@injectable
class AuthActorCubit extends Cubit<AuthActorState> {
  final IAuthFacade _iAuthFacade;

  AuthActorCubit(this._iAuthFacade) : super(_Initial());

  Future<void> signInWithGoogle() async {
    emit(AuthActorState.loading());
    await _iAuthFacade.signInWithGoogle();
    emit(AuthActorState.success());
  }

  Future<void> signOut() async {
    emit(AuthActorState.loading());
    await _iAuthFacade.signOut();
    emit(AuthActorState.success());
  }
}
