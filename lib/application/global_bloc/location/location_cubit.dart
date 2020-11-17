import 'package:bloc/bloc.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/location/location_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';
part 'location_cubit.freezed.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final ILocationRepository _iLocationRepository;
  LocationCubit(this._iLocationRepository) : super(_Initial());

  Future<void> getUserLocation() async {
    emit(LocationState.getting());
    final locationOption = await _iLocationRepository.getLocation();
    locationOption.fold(
        () => emit(
            LocationState.failure(LocationFailures.insufficientPermission())),
        (location) => emit(LocationState.success(location)));
  }


}
