part of 'store_form_cubit.dart';

@freezed
abstract class StoreFormState with _$StoreFormState {
  const factory StoreFormState({
    @required Store store,
    @required bool isEditting,
    @required bool isSaving,
    @required bool showErrorMessage,
    @required Option<Either<StoreFailure, Unit>> saveFailureOrSuccessOption,
  }) = _StoreFormState;

  factory StoreFormState.initial() => StoreFormState(
        store: Store.created(),
        isEditting: false,
        isSaving: false,
        showErrorMessage: false,
        saveFailureOrSuccessOption: none(),
      );
}
