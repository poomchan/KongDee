import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location_failures.dart';
import 'package:fluttertaladsod/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final ILocationRepository _locationRepository = getIt<ILocationRepository>();

  OnboardingCubit() : super(const _Initial());

  Future<void> requestLocationPermission() async {
    final Either<LocationFailures, Unit> result =
        await _locationRepository.requestLocationPermission();
    result.fold(
      (l) => _locationRepository.openAppSetting(),
      (r) => emit(
        const OnboardingState.granted(),
      ),
    );
  }
}
