// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class ValueFailure with _$ValueFailure {
  const factory ValueFailure.exceedingLength(
    dynamic failedValue,
    int max,
  ) = ExceedingLength;
  const factory ValueFailure.empty(
    dynamic failedValue,
  ) = Empty;
  const factory ValueFailure.multiline(
    dynamic failedValue,
  ) = Multiline;
  const factory ValueFailure.listTooLong(
    dynamic failedValue,
    int max,
  ) = ListTooLong;
  const factory ValueFailure.invalidEmail(
    dynamic failedValue,
  ) = InvalidEmail;
  const factory ValueFailure.shortPassword(
    dynamic failedValue,
  ) = ShortPassword;
  const factory ValueFailure.numberNotPositive(
    dynamic failedValue,
  ) = NumberNotPositive;
  const factory ValueFailure.nullValue(
    dynamic failedValue,
  ) = NullValue;
}
