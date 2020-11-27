import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/global_bloc/auth/watcher/auth_watcher_cubit.dart';
import 'package:fluttertaladsod/domain/auth/user.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
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
  final ILocationRepository _iLocationRepository;

  StoreViewCubit(this._iStoreRepository, this._iLocationRepository)
      : super(_Initial());

  Future<void> watchStoreStarted(BuildContext context,
      {@required UniqueId storeId}) async {
    assert(storeId != null);
    emit(StoreViewState.loading());

    final locationOption = await _iLocationRepository.getLocation();
    locationOption.fold(
      () => emit(StoreViewState.failure(StoreFailure.locationNotGranted())),
      (location) async {
        try {
          final userBloc = BlocProvider.of<AuthWatcherCubit>(context);
          final Option<UserDomain> userOption = userBloc.state.maybeMap(
            authenticated: (state) => some(state.user),
            orElse: () => none(),
          );

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
        } catch (e) {
          print(e);
        }
      },
    );
  }
}