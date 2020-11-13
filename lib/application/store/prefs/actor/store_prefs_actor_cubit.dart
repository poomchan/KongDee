import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/store/store_view/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_prefs_actor_state.dart';
part 'store_prefs_actor_cubit.freezed.dart';

@injectable
class StorePrefsActorCubit extends Cubit<StorePrefsActorState> {
  final IStoreRepository _iStoreRepository;

  StorePrefsActorCubit(this._iStoreRepository)
      : super(StorePrefsActorState.initial());

  Future<void> storeOpenChange(BuildContext context,
      {@required bool isOpen}) async {
    final storeViewBloc = BlocProvider.of<StoreViewCubit>(context);
    final store = storeViewBloc.state.maybeMap(
      orElse: () => null,
      success: (s) => s.store,
    );

    if (store == null) {
      return;
    }

    _iStoreRepository.update(
      store.copyWith(
        prefs: store.prefs.copyWith(isOpen: isOpen),
      ),
    );
  }
}
