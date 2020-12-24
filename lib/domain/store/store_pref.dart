
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_pref.freezed.dart';
part 'store_pref.g.dart';

@immutable
@freezed
abstract class StorePrefs implements _$StorePrefs {
  const factory StorePrefs({
    @required @JsonKey(defaultValue: true) bool isOpen,
    @required @JsonKey(defaultValue: true) bool isNotificationOn,
    @required @JsonKey(defaultValue: 1) double sellingRange,
  }) = _StorePrefs;

  factory StorePrefs.created() {
    return StorePrefs(
      isOpen: true,
      isNotificationOn: true,
      sellingRange: 1,
    );
  }

  factory StorePrefs.fromJson(Map<String, dynamic> json) =>
      _$StorePrefsFromJson(json);

  const StorePrefs._();
}
