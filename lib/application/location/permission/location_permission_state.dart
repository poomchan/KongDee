part of 'location_permission_cubit.dart';

@freezed
abstract class LocationPermissionState with _$LocationPermissionState {
  const factory LocationPermissionState.inital() = _Initial;
  const factory LocationPermissionState.loading() = _Loading;
  const factory LocationPermissionState.granted() = _Granted;
  const factory LocationPermissionState.denied() = _Denied;
}
