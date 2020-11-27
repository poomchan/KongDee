import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'range_form_state.dart';
part 'range_form_cubit.freezed.dart';

@injectable
class RangeFormCubit extends Cubit<RangeFormState> {
  RangeFormCubit() : super(RangeFormState.initial());

  Future<void> initializeForm(SellingRange initRange) async {
    final bool isInfinite = initRange.getOrCrash() == double.infinity;
    if (isInfinite) {
      emit(state.copyWith(
        isInfinite: true,
        range: initRange,
      ));
    } else {
      emit(state.copyWith(
        isInfinite: false,
        range: initRange,
      ));
    }
  }

  Future<void> onRangeChanged(String range) async {
    if (range.isEmpty) {
      emit(state.copyWith(
        isValid: false,
      ));
      return;
    }
    try {
      final numRange = double.parse(range);
      if (numRange <= 0) {
        emit(state.copyWith(
          isValid: false,
        ));
        return;
      }
      emit(state.copyWith(
        range: SellingRange(numRange),
        isValid: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        isValid: false,
      ));
    }
  }

  Future<void> onInfiniteRangeChanged({@required bool isInfinite}) async {
    emit(state.copyWith(
      isInfinite: isInfinite,
      isValid: true,
    ));
  }
}
