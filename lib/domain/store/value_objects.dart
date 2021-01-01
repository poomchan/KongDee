// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/core/value_validators.dart';

class StoreName extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  static const maxLength = 30;

  factory StoreName(String input) {
    return StoreName._(validateInputNotNull(input)
        .flatMap((_) => validateMaxStringLength(input, maxLength))
        .flatMap(validateStringNotEmpty)
        .flatMap(validateSingleLine));
  }
  const StoreName._(this.value);
}

class StoreMenu extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;
  static const maxLength = 500;

  factory StoreMenu(String input) {
    assert(input != null);
    return StoreMenu._(validateInputNotNull(input)
        .flatMap((_) => validateMaxStringLength(input, maxLength)));
  }

  const StoreMenu._(this.value);
}

class StoreBanner extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory StoreBanner(String input) {
    assert(input != null);
    return StoreBanner._(validateInputNotNull(input));
  }
  factory StoreBanner.created() {
    return StoreBanner._(right(
        'https://via.placeholder.com/700x650.png?text=Click+here+to+add+an+image'));
  }

  const StoreBanner._(this.value);
}

class StorePic extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  factory StorePic(String input) {
    assert(input != null);
    return StorePic._(validateInputNotNull(input));
  }

  const StorePic._(this.value);
}

class StorePic16 extends ValueObject<List<StorePic>> {
  @override
  final Either<ValueFailure, List<StorePic>> value;
  // return ValueFailure if the list is over sized -> time to buy premium
  static const maxLength = 16;

  factory StorePic16(List<StorePic> input) {
    return StorePic16._(validateInputNotNull(input)
        .flatMap((_) => validateMaxListLength(input, maxLength)));
  }

  const StorePic16._(this.value);

  int get length => value.getOrElse(() => List.empty()).length;

  bool get isFull => length == maxLength;
}

// range in meter
class SellingRange extends ValueObject<double> {
  @override
  final Either<ValueFailure, double> value;
  static const maxRange = 16;
  bool get isInFinite =>
      value.fold((f) => throw 'value failure', (val) => val == double.infinity);

  factory SellingRange(double input) {
    return SellingRange._(validateInputNotNull(input));
  }

  factory SellingRange.infinite() {
    return SellingRange._(right(double.infinity));
  }

  factory SellingRange.created() {
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
  final Either<ValueFailure, String> value;

  factory StoreAddress(String input) {
    return StoreAddress._(validateInputNotNull(input));
  }

  const StoreAddress._(this.value);
}
