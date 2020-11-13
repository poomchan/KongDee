// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_prefs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StorePrefsDto _$_$_StorePrefsDtoFromJson(Map<String, dynamic> json) {
  return _$_StorePrefsDto(
    isOpen: json['isOpen'] as bool,
    isNotificationOn: json['isNotificationOn'] as bool,
    sellingRange: (json['sellingRange'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_StorePrefsDtoToJson(_$_StorePrefsDto instance) =>
    <String, dynamic>{
      'isOpen': instance.isOpen,
      'isNotificationOn': instance.isNotificationOn,
      'sellingRange': instance.sellingRange,
    };
