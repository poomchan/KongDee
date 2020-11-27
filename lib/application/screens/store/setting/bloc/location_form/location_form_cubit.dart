import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'location_form_state.dart';
part 'location_form_cubit.freezed.dart';

@injectable
class LocationFormCubit extends Cubit<LocationFormState> {
  final ILocationRepository _iLocationRepository;

  LocationFormCubit(this._iLocationRepository)
      : super(LocationFormState.initial());

  Future<void> initializeForm(
    StoreLocation initLocation,
  ) async {
    emit(state.copyWith(location: initLocation));
  }

  Future<void> locationRequested() async {
    final locationOption = await _iLocationRepository.getLocation();
    locationOption.fold(
      () => null,
      (l) => emit(
        state.copyWith(location: StoreLocation.fromLocationDomain(l)),
      ),
    );
  }
}
