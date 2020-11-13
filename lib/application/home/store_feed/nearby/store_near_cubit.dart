import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/home/store_feed/nearby/store_list.dart';
import 'package:fluttertaladsod/domain/auth/i_auth_facade.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

part 'store_near_cubit.freezed.dart';
part 'store_near_state.dart';

@injectable
class StoreNearCubit extends Cubit<StoreNearState>{
  final IStoreRepository _iStoreRepository;
  final ILocationRepository _iLocationRepository;
  final IAuthFacade _iAuthFacade;

  final radiusSubject = BehaviorSubject<double>.seeded(1.0);

  static const initRad = 1.0;
  double rad = 1;
  StoreList storeList = StoreList.empty();

  StoreNearCubit(this._iStoreRepository, this._iLocationRepository, this._iAuthFacade)
      : super(_Initial());

  Future<void> watchNearbyStore() async {
    emit(StoreNearState.loading(storeList.value));

    final locationOption = await _iLocationRepository.getLocation();
    final location = locationOption.getOrElse(() => null);

    final userOption = await _iAuthFacade.getSignedInUser();

    if (location == null) {
      emit(StoreNearState.failure(StoreFailure.locationNotGranted()));
      return;
    }

    final storeStream = _iStoreRepository
        .watchNearbyStore(location: location, rad: radiusSubject, userOption: userOption);

    storeStream.listen((failureOrStoreList) {
      failureOrStoreList.fold(
        (f) => emit(StoreNearState.failure(f)),
        (storeList) {
          this.storeList = StoreList.fromList(storeList);
          emit(StoreNearState.loaded(this.storeList.value, rad));
        },
      );
    });
  }

  Future<void> requestMoreRadius() async {
    emit(StoreNearState.loading(storeList.value));
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
