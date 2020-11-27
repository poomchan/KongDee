part of 'location_form_cubit.dart';

@freezed
abstract class LocationFormState with _$LocationFormState {
  const factory LocationFormState({
    @required StoreLocation location,
  }) = _LocationFormState;

  factory LocationFormState.initial() => LocationFormState(
    location: StoreLocation.created(),
  );
}
