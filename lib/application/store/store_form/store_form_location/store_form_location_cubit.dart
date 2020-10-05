import 'package:bloc/bloc.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location.dart';
import 'package:fluttertaladsod/domain/location/location_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'store_form_location_state.dart';
part 'store_form_location_cubit.freezed.dart';

@injectable
class StoreFormLocationCubit extends Cubit<StoreFormLocationState> {
  StoreFormLocationCubit(this._iLocationRepository) : super(_Initial());

  final ILocationRepository _iLocationRepository;

  Future<void> getUserLocation() async {
    print('getting location');
    emit(StoreFormLocationState.loading());
    final locationOption = await _iLocationRepository.getLocation();
    locationOption.fold(
        () => emit(StoreFormLocationState.failure(
            LocationFailures.insufficientPermission())),
        (location) => emit(StoreFormLocationState.success(location)));
  }
}
