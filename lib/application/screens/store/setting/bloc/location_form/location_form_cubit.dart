import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/application/screens/store/view_page/bloc/store_view_cubit.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/store/location/store_location.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'location_form_state.dart';
part 'location_form_cubit.freezed.dart';

class LocationFormCubit extends Cubit<LocationFormState> {
  final ILocationRepository _iLocationRepository = getIt<ILocationRepository>();

  LocationFormCubit() : super(LocationFormState.initial());

  Future<void> initializeForm() async {
    final watcherBloc = Get.find<StoreViewCubit>();
    emit(
      state.copyWith(
        // just read a single state, not reactive
        location: watcherBloc.state.maybeMap(
            success: (s) => s.store.location,
            orElse: () => throw '404: store not found'),
      ),
    );
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
