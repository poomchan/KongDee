part of 'range_form_cubit.dart';

@freezed
abstract class RangeFormState with _$RangeFormState {
  const factory RangeFormState({
    @required SellingRange range,
    @required bool isInfinite,
    @required bool isValid,
  }) = _RangeFormState;

  factory RangeFormState.initial() => RangeFormState(
    range: SellingRange.created(),
    isInfinite: false,
    isValid: true,
  );
}
