import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/subjects.dart';

part 'store_near_cubit.freezed.dart';
part 'store_near_state.dart';

class StoreNearCubit extends Cubit<StoreNearState> {
  final IStoreRepository _iStoreRepository = getIt<IStoreRepository>();
  final ILocationRepository _iLocationRepository = getIt<ILocationRepository>();
  final IAuthFacade _iAuthFacade = getIt<IAuthFacade>();

  final radiusSubject = BehaviorSubject<double>.seeded(1.0);
  static const initRad = 1.0;
  double rad = 1;
  List<Store> storeList = List.empty();

  StoreNearCubit() : super(_Initial());

  Future<void> watchNearbyStore() async {
    emit(StoreNearState.loading(storeList));

    final locationOption = await _iLocationRepository.getLocation();

    locationOption.fold(
      () => emit(StoreNearState.failure(StoreFailure.locationNotGranted())),
      (location) async {
        final userOption = await _iAuthFacade.getSignedInUser();

        final storeStream = _iStoreRepository.watchNearbyStore(
            location: location, rad: radiusSubject, userOption: userOption);

        storeStream.listen((failureOrStoreList) {
          failureOrStoreList.fold(
            (f) => emit(StoreNearState.failure(f)),
            (storeList) {
              this.storeList = storeList;
              emit(StoreNearState.loaded(this.storeList, rad));
            },
          );
        });
      },
    );
  }

  Future<void> requestMoreRadius() async {
    emit(StoreNearState.loading(storeList));
    rad += 0.5;
    radiusSubject.add(rad);
  }

  Future<void> drainRadius() async {
    rad = initRad;
    radiusSubject.add(rad);
  }

  @override
  Future<void> close() {
    radiusSubject.close();
    return super.close();
  }
}
