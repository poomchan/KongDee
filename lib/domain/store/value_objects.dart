import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/core/value_validators.dart';

class StoreName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 30;

  factory StoreName(String input) {
    assert(input != null);
    return StoreName._(validateMaxStringLength(input, maxLength)
        .flatMap(validateStringNotEmpty)
        .flatMap(validateSingleLine));
  }
  const StoreName._(this.value);
}

class StoreMenu extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  static const maxLength = 500;

  factory StoreMenu(String input) {
    assert(input != null);
    return StoreMenu._(validateMaxStringLength(input, maxLength));
  }

  const StoreMenu._(this.value);
}

class StoreBanner extends ValueObject<Either<File, String>> {
  @override
  final Either<ValueFailure<Either<File, String>>, Either<File, String>> value;

  factory StoreBanner.url(String input) {
    assert(input != null);
    return StoreBanner._(right(right(input)));
  }

  factory StoreBanner.file(File input) {
    assert(input != null);
    return StoreBanner._(right(left(input)));
  }

  String get url => value.fold(
        (f) => null,
        (v) => v.fold((file) => null, (url) => url),
      );

  const StoreBanner._(this.value);
}

class StorePic {
  final Either<File, String> fileOrUrl;

  factory StorePic.url(String input) {
    assert(input != null);
    return StorePic._(right(input));
  }

  factory StorePic.file(File input) {
    assert(input != null);
    return StorePic._(left(input));
  }

  const StorePic._(this.fileOrUrl);
}

class StorePic16 extends ValueObject<List<StorePic>> {
  @override
  final Either<ValueFailure<List<StorePic>>, List<StorePic>> value;
  // return ValueFailure if the list is over sized -> time to buy premium
  static const maxLength = 16;

  factory StorePic16(List<StorePic> input) {
    return StorePic16._(validateMaxListLength(input, maxLength));
  }

  const StorePic16._(this.value);

  int get length => value.getOrElse(() => List.empty()).length;

  bool get isFull => length == maxLength;
}

// range in meter
class SellingRange extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;
  static const maxRange = 16;
  bool get isInFinite => value.fold((f) => throw 'value failure', (val) => val == double.infinity);

  factory SellingRange(double input) {
    return SellingRange._(right(input));
  }

  factory SellingRange.infinite(){
    return SellingRange._(right(double.infinity));
  }

  factory SellingRange.created(){
    return SellingRange._(right(1));
  }

  const SellingRange._(this.value);

  bool isInCoverage(double distance) {
    if (distance > value.getOrElse(() => throw 'null range or failure')) {
      return false;
    } else {
      return true;
    }
  }
}

class StoreAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StoreAddress(String input) {
    return StoreAddress._(right(input));
  }

  const StoreAddress._(this.value);
}