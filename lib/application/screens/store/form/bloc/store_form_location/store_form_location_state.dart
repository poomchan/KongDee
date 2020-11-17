part of 'store_form_location_cubit.dart';

@freezed
abstract class StoreFormLocationState with _$StoreFormLocationState {
  const factory StoreFormLocationState.inital() = _Initial;
  const factory StoreFormLocationState.loading() = _Loading;
  const factory StoreFormLocationState.success(LocationDomain location) =
      _Success;
  const factory StoreFormLocationState.failure(LocationFailures f) = _Failure;
}
