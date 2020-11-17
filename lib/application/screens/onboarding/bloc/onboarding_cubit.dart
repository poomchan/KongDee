import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/location/i_location_repository.dart';
import 'package:fluttertaladsod/domain/location/location_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  final ILocationRepository _locationRepository;

  OnboardingCubit(this._locationRepository) : super(const _Initial());

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
