import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_validators.dart';

Either<ValueFailure, dynamic> validateMessageBody(
  String input, {
  int maxLength = 200,
}) {
  return validateStringNotEmpty(input)
        .andThen(validateMaxStringLength(input, maxLength));
}
  

