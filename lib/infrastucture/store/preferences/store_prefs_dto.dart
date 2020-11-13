import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertaladsod/domain/store/preferences/store_pref.dart';
import 'package:fluttertaladsod/domain/store/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_prefs_dto.freezed.dart';
part 'store_prefs_dto.g.dart';

@immutable
@freezed
abstract class StorePrefsDto implements _$StorePrefsDto {
  const factory StorePrefsDto({
    @required bool isOpen,
    @required bool isNotificationOn,
    @required double sellingRange,
  }) = _StorePrefsDto;

  factory StorePrefsDto.fromDomain(StorePrefs p) {
    return StorePrefsDto(
      isOpen: p.isOpen,
      isNotificationOn: p.isNotificationOn,
      sellingRange: p.sellingRange.getOrCrash(),
    );
  }

  StorePrefs toDomain() {
    return StorePrefs(
      isOpen: isOpen,
      isNotificationOn: isNotificationOn,
      sellingRange: SellingRange(sellingRange),
    );
  }

  factory StorePrefsDto.fromFirestore(DocumentSnapshot snap) {
    return StorePrefsDto.fromJson(snap.data());
  }

  factory StorePrefsDto.fromJson(Map<String, dynamic> json) =>
      _$StorePrefsDtoFromJson(json);

  const StorePrefsDto._();
}
