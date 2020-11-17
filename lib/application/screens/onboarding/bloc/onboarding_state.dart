part of 'onboarding_cubit.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState.inital() = _Initial;
  const factory OnboardingState.loading() = _Loading;
  const factory OnboardingState.granted() = _Granted;
  const factory OnboardingState.denied() = _Denied;
}
