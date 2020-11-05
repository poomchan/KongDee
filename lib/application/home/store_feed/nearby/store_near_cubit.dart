import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/home/store_feed/nearby/store_list.dart';
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
class StoreNearCubit extends Cubit<StoreNearState> {
  final IStoreRepository _iStoreRepository;
  final ILocationRepository _iLocationRepository;

  final radiusSubject = BehaviorSubject<double>.seeded(1.0);
  final deepEq = const DeepCollectionEquality();

  Stream<Either<StoreFailure, List<Store>>> storeStream;

  static const initRad = 1.0;
  double rad = 1;
  StoreList storeList = StoreList.empty();

  StoreNearCubit(this._iStoreRepository, this._iLocationRepository)
      : super(_Initial());

  Future<void> watchNearbyStore() async {
    emit(StoreNearState.loading(storeList.value));

    final locationOption = await _iLocationRepository.getLocation();
    final location = locationOption.getOrElse(() => null);

    if (location == null) {
      emit(StoreNearState.failure(StoreFailure.locationNotGranted()));
      return;
    }

    storeStream = _iStoreRepository
        .watchNearbyStore(location: location, rad: radiusSubject)
        .asBroadcastStream();

    storeStream.listen((failureOrStoreList) {
      failureOrStoreList.fold(
        (f) => emit(StoreNearState.failure(f)),
        (storeList) {
          // print('CUBIT: storeCount: ${storeList.length}');
          this.storeList = StoreList.fromList(storeList);
          emit(StoreNearState.loaded(this.storeList.value, rad));
        },
      );
    });
  }

  Future<void> requestMoreRadius() async {
    emit(StoreNearState.loading(storeList.value));

    // _foundStoresStream().listen((failOrFound) {
    //   failOrFound.fold(
    //     (fail) => null,
    //     (found) {
    //       if (!found) {
    //         rad += 0.5;
    //         radiusSubject.add(rad);
    //       }
    //     },
    //   );
    // });
    rad += 0.5;
    radiusSubject.add(rad);
  }

  Stream<Either<StoreFailure, bool>> _foundStoresStream() async* {
    yield* storeStream.map((fOrStoreList) {
      return fOrStoreList.fold(
        (f) => left<StoreFailure, bool>(f),
        (storeList) {
          final isEqual = StoreList.fromList(storeList) == this.storeList;
          // print(isEqual);
          return right<StoreFailure, bool>(isEqual);
        },
      );
    });
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
