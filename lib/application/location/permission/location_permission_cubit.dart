import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'location_permission_state.dart';
part 'location_permission_cubit.freezed.dart';

@injectable
class LocationPermissionCubit extends Cubit<LocationPermissionState> {
  final ILocationRepository _locationRepository;

  LocationPermissionCubit(this._locationRepository) : super(const _Initial());

  Future<void> checkPermissionStatus() async {
    print('checking location permission');
    emit(const LocationPermissionState.loading());
    final bool isLocationGranted =
        await _locationRepository.checkPermissionStatus();
    if (isLocationGranted) {
      emit(const LocationPermissionState.granted());
    } else {
      emit(const LocationPermissionState.denied());
    }
  }

  Future<void> requestLocationPermission() async {
    final Either<LocationFailures, Unit> result =
        await _locationRepository.requestLocationPermission();
    result.fold(
      (l) => _locationRepository.openAppSetting(),
      (r) => emit(
        const LocationPermissionState.granted(),
      ),
    );
  }
}
