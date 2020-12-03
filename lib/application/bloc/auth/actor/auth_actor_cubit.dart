import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertaladsod/application/routes/router.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'auth_actor_cubit.freezed.dart';
part 'auth_actor_state.dart';

class AuthActorCubit extends Cubit<AuthActorState> {
  final IAuthFacade _iAuthFacade = getIt<IAuthFacade>();

  AuthActorCubit() : super(_Initial());

  Future<void> signInWithGoogle() async {
    emit(AuthActorState.loading());
    await _iAuthFacade.signInWithGoogle();
    emit(AuthActorState.success());
  }

  Future<void> signOut() async {
    emit(AuthActorState.loading());
    try {
      await _iAuthFacade.signOut();
      emit(AuthActorState.success());
      await Get.offAllNamed(Routes.homePage);
    } catch (e) {
      emit(AuthActorState.failue());
    }
  }
}
