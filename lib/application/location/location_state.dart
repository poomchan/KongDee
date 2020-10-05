part of 'location_cubit.dart';

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState.inital() = _Initial;
  const factory LocationState.getting() = _Getting;
  const factory LocationState.success(LocationDomain location) = _Success;
  const factory LocationState.failure(LocationFailures f) = _Failure;
}
