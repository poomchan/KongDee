// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_pref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StorePrefs _$_$_StorePrefsFromJson(Map<String, dynamic> json) {
  return _$_StorePrefs(
    isOpen: json['isOpen'] as bool ?? true,
    isNotificationOn: json['isNotificationOn'] as bool ?? true,
    sellingRange: (json['sellingRange'] as num)?.toDouble() ?? 1,
  );
}

Map<String, dynamic> _$_$_StorePrefsToJson(_$_StorePrefs instance) =>
    <String, dynamic>{
      'isOpen': instance.isOpen,
      'isNotificationOn': instance.isNotificationOn,
      'sellingRange': instance.sellingRange,
    };
