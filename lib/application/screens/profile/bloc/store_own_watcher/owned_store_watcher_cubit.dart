import 'package:bloc/bloc.dart';
import 'package:fluttertaladsod/application/global_bloc/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'owned_store_watcher_state.dart';
part 'owned_store_watcher_cubit.freezed.dart';

class OwnedStoreWatcherCubit extends Cubit<OwnedStoreWatcherState> {
  final IStoreRepository _iStoreRepository = getIt<IStoreRepository>();
  final ILocationRepository _iLocationRepository = getIt<ILocationRepository>();

  OwnedStoreWatcherCubit() : super(_Initial());

  Future<void> watchOwnedStoreStarted() async {
    emit(OwnedStoreWatcherState.loadInProgress());

    final locationOption = await _iLocationRepository.getLocation();

    final authBloc = Get.find<AuthWatcherCubit>();

    final user = authBloc.state.maybeMap(
      authenticated: (s) => s.user,
      orElse: () => throw 'user not authenticated',
    );

    locationOption.fold(
      () => emit(OwnedStoreWatcherState.loadFailure(
          StoreFailure.locationNotGranted())),
      (location) {
        final stream = _iStoreRepository.watchOwnedStore(
          ownerId: user.id,
          location: location,
          user: user,
        );
        stream.listen(
          (storeOrF) {
            return storeOrF.fold(
                (f) => emit(OwnedStoreWatcherState.loadFailure(f)),
                (store) => emit(OwnedStoreWatcherState.loadSuccess(store)));
          },
        );
      },
    );
  }
}
