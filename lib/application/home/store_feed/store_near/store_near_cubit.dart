import 'dart:math' show cos, sqrt, asin;

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertaladsod/application/location/location_cubit.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/store/i_store_repository.dart';
import 'package:fluttertaladsod/domain/store/store.dart';
import 'package:fluttertaladsod/domain/store/store_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_near_cubit.freezed.dart';
part 'store_near_state.dart';

@injectable
class StoreNearCubit extends Cubit<StoreNearState> {
  final IStoreRepository _iStoreRepository;
  double rad = 1.0;

  List<Store> storeList = [];

  StoreNearCubit(this._iStoreRepository) : super(_Initial());

  Future<void> watchNearbyStore(BuildContext context) async {
    emit(StoreNearState.loading(storeList));
    _iStoreRepository
        .watchNearbyStore(context, rad: rad)
        .listen((failureOrStoreList) {
      failureOrStoreList.fold(
        (f) => emit(StoreNearState.failure(f)),
        (storeList) {
          print('emitting storeList');
          this.storeList = _calculateDistanceAway(context, storeList);
          emit(StoreNearState.loaded(this.storeList));
        },
      );
    });
  }

   Future<void> requestMoreRadius() async {
     emit(StoreNearState.loading(storeList));
     rad += 1;
    _iStoreRepository.addMoreRadius(rad);
  }

  List<Store> _calculateDistanceAway(
      BuildContext context, List<Store> storeList) {
    final LocationCubit locationBloc = BlocProvider.of<LocationCubit>(context);
    final LocationDomain location = locationBloc.state.maybeMap(
      success: (state) => state.location,
      orElse: () => throw 'location not granted',
    );

    final List<Store> formattedStoreList = [];

    for (final Store store in storeList) {
      const p = 0.017453292519943295;
      const c = cos;
      final lat1 = store.geoPoint.latitude;
      final lon1 = store.geoPoint.longitude;
      final lat2 = location.geoFirePoint.latitude;
      final lon2 = location.geoFirePoint.longitude;
      final a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
      final double result = 12742 * asin(sqrt(a));
      final formattedStore = store.copyWith(distanceAway: result.toInt());
      formattedStoreList.add(formattedStore);
    }
    return formattedStoreList;
  }
}
