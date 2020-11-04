import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'store_near_cubit.freezed.dart';
part 'store_near_state.dart';

@injectable
class StoreNearCubit extends Cubit<StoreNearState> {
  
  final IStoreRepository _iStoreRepository;
  final ILocationRepository _iLocationRepository;
  final radius = BehaviorSubject<double>.seeded(1.0);
  List<Store> storeList = [];

  StoreNearCubit(this._iStoreRepository, this._iLocationRepository) : super(_Initial());

  Future<void> watchNearbyStore(BuildContext context) async {
    emit(StoreNearState.loading(storeList));

    final locationOption = await _iLocationRepository.getLocation();
    final location = locationOption.getOrElse(() => null);

    if (location == null) {
      emit(StoreNearState.failure(StoreFailure.locationNotGranted()));
      return;
    }

    _iStoreRepository
        .watchNearbyStore(rad: 1.0, location: location, radius: radius)
        .listen((failureOrStoreList) {
      failureOrStoreList.fold(
        (f) => emit(StoreNearState.failure(f)),
        (storeList) {
          if (storeList.length > this.storeList.length) {
            this.storeList = storeList;
            emit(StoreNearState.loaded(this.storeList));
          }
        },
      );
    });
  }

  Future<void> requestMoreRadius({bool isLoading = true}) async {
    if (isLoading) emit(StoreNearState.loading(this.storeList));
    radius.add(1.0);
    print('bloc: adding radius');
  }

  @override
  Future<void> close() {
    radius.close();
    return super.close();
  }
}
