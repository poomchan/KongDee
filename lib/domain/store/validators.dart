import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_validators.dart';
import 'package:fluttertaladsod/domain/store/store.dart';

Either<ValueFailure<dynamic>, Unit> validateStoreName(
  String input, {
  int maxLength = Store.nameLength,
}) {
  final fOrValue = validateMaxStringLength(input, maxLength)
      .flatMap(validateStringNotEmpty)
      .flatMap(validateSingleLine);
  return fOrValue.fold((f) => left(f), (ok) => right(unit));
}

Either<ValueFailure<dynamic>, Unit> validateStoreMenu(
  String input, {
  int maxLength = Store.menuLength,
}) {
  final fOrValue = validateMaxStringLength(input, maxLength)
      .flatMap(validateStringNotEmpty);
  return fOrValue.fold((f) => left(f), (ok) => right(unit));
}

Either<ValueFailure<dynamic>, Unit> validateStorePics(
  List<String> input, {
  int maxLength = Store.picListLength,
}) {
  final fOrValue = validateMaxListLength(input, maxLength);
  return fOrValue.fold((f) => left(f), (ok) => right(unit));
}
