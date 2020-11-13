import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/core/value_failures.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_pref.freezed.dart';

@immutable
@freezed
abstract class StorePrefs implements _$StorePrefs {
  const factory StorePrefs({
    @required bool isOpen,
    @required bool isNotificationOn,
    @required SellingRange sellingRange,
  }) = _StorePrefs;

  factory StorePrefs.created() {
    return StorePrefs(
      isOpen: true,
      isNotificationOn: true,
      sellingRange: SellingRange.created(),
    );
  }

  Option<ValueFailure<dynamic>> get failureOption {
    return sellingRange.failureOrUnit.fold((f) => some(f), (r) => none());
  }

  const StorePrefs._();
}
