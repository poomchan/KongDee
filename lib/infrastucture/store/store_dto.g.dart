// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreDto _$_$_StoreDtoFromJson(Map<String, dynamic> json) {
  return _$_StoreDto(
    name: json['name'] as String ?? '',
    menu: json['menu'] as String ?? '',
    banner: json['banner'] as String ?? '',
    pics: (json['pics'] as List)?.map((e) => e as String)?.toList() ?? [],
    ownerId: json['ownerId'] as String ?? '',
    location: json['location'] == null
        ? null
        : StoreLocationDto.fromJson(json['location'] as Map<String, dynamic>),
    prefs: json['prefs'] == null
        ? null
        : StorePrefsDto.fromJson(json['prefs'] as Map<String, dynamic>),
    serverTimeStamp:
        const ServerTimestampConverter().fromJson(json['serverTimeStamp']),
    blockedUsers: (json['blockedUsers'] as Map<String, dynamic>)?.map(
          (k, e) => MapEntry(k, e as bool),
        ) ??
        {},
  );
}

Map<String, dynamic> _$_$_StoreDtoToJson(_$_StoreDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'menu': instance.menu,
      'banner': instance.banner,
      'pics': instance.pics,
      'ownerId': instance.ownerId,
      'location': instance.location?.toJson(),
      'prefs': instance.prefs?.toJson(),
      'serverTimeStamp':
          const ServerTimestampConverter().toJson(instance.serverTimeStamp),
      'blockedUsers': instance.blockedUsers,
    };
