import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/auth/actor/auth_actor_cubit.dart';
import 'package:fluttertaladsod/application/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
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

  Future<void> watchStoreStarted(
      {@required UniqueId storeId, @required BuildContext context}) async {
    assert(storeId != null);
    emit(StoreViewState.loading());

    try {
      final locationBloc = context.read<LocationCubit>();
      final userBloc = context.read<AuthWatcherCubit>();

      final Option<UserDomain> userOption = userBloc.state.maybeMap(
      authenticated: (state) => some(state.user),
      orElse: () => none(),
    );

    final Option<LocationDomain> locationOption = locationBloc.state.maybeMap(
      success: (s) => some(s.location),
      orElse: () => none(),
    );

    locationOption.fold(
      () => emit(StoreViewState.failure(StoreFailure.locationNotGranted())),
      (location) {
        final storeOrFailureStream = _iStoreRepository.watchSingleStore(
          storeId: storeId,
          location: location,
          userOption: userOption,
        );
        storeOrFailureStream.listen(
          (storeOrF) {
            return storeOrF.fold(
              (f) => emit(StoreViewState.failure(f)),
              (store) => emit(StoreViewState.success(store)),
            );
          },
        );
      },
    );
    } catch (e) {
      print(e);
    }
  }
}
