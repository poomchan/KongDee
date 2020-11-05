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
