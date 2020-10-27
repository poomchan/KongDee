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

  Future<void> watchNearbyStore(BuildContext context,
      {bool isFirstBatch = true}) async {
    emit(StoreNearState.loading(storeList));
    _iStoreRepository
        .watchNearbyStore(context, rad: rad)
        .listen((failureOrStoreList) {
      failureOrStoreList.fold(
        (f) => emit(StoreNearState.failure(f)),
        (storeList) {
          if (storeList.length > this.storeList.length) {
            this.storeList = storeList;
            if (isFirstBatch) emit(StoreNearState.loaded(this.storeList));
          } else {
            requestMoreRadius(isLoading: false);
          }
        },
      );
    });
  }

  Future<void> requestMoreRadius({bool isLoading = true}) async {
    if (isLoading) emit(StoreNearState.loading(this.storeList));
    rad += 1;
    // print('repo: adding radius');
    _iStoreRepository.addMoreRadius(rad);
  }
}
