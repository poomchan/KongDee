import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength(
    T failedValue,
    int max,
  ) = ExceedingLength<T>;
  const factory ValueFailure.empty(
    T failedValue,
  ) = Empty<T>;
  const factory ValueFailure.multiline(
    T failedValue,
  ) = Multiline<T>;
  const factory ValueFailure.listTooLong(
    T failedValue,
    int max,
  ) = ListTooLong<T>;
  const factory ValueFailure.invalidEmail(
    T failedValue,
  ) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword(
    T failedValue,
  ) = ShortPassword<T>;
  const factory ValueFailure.numberNotPositive(
    T failedValue,
  ) = NumberNotPositive<T>;
  const factory ValueFailure.nullValue() = NullValue;
}
