import 'package:bloc/bloc.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_view_state.dart';
part 'store_view_cubit.freezed.dart';

@injectable
class StoreViewCubit extends Cubit<StoreViewState> {
  final IStoreRepository _iStoreRepository;

  StoreViewCubit(this._iStoreRepository) : super(_Initial());

  Future<void> watchStoreStarted({UniqueId storeId}) async {
    emit(StoreViewState.loading());
    final storeOrFailureStream = _iStoreRepository.watchSingleStore(storeId.getOrCrash());
    storeOrFailureStream.listen(
      (storeOrF) {
        return storeOrF.fold((f) => emit(StoreViewState.failure(f)),
            (store) => emit(StoreViewState.success(store)));
      },
    );
  }
}
