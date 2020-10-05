import 'package:bloc/bloc.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'owned_store_watcher_state.dart';
part 'owned_store_watcher_cubit.freezed.dart';

@injectable
class OwnedStoreWatcherCubit extends Cubit<OwnedStoreWatcherState> {
  final IStoreRepository _iStoreRepository;

  OwnedStoreWatcherCubit(this._iStoreRepository) : super(_Initial());

  Future<void> watchOwnedStoreStarted(String ownerId) async {
    emit(OwnedStoreWatcherState.loadInProgress());
    final storeOrFailureStream = _iStoreRepository.watchOwnedStore(ownerId);
    storeOrFailureStream.listen(
      (storeOrF) {
        return storeOrF.fold((f) => emit(OwnedStoreWatcherState.loadFailure(f)),
            (store) => emit(OwnedStoreWatcherState.loadSuccess(store)));
      },
    );
  }
}
