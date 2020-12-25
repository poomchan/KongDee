// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$_$_StoreFromJson(Map<String, dynamic> json) {
  return _$_Store(
    ownerId: json['ownerId'] as String ?? '',
    name: json['name'] as String ?? '',
    banner: json['banner'] as String ?? '',
    menu: json['menu'] as String ?? '',
    pics: (json['pics'] as List)?.map((e) => e as String)?.toList() ?? [],
    blockedUsers: (json['blockedUsers'] as Map<String, dynamic>)?.map(
          (k, e) => MapEntry(k, e as bool),
        ) ??
        {},
    location: json['location'] == null
        ? null
        : StoreLocation.fromJson(json['location'] as Map<String, dynamic>),
    prefs: json['prefs'] == null
        ? null
        : StorePrefs.fromJson(json['prefs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'ownerId': instance.ownerId,
      'name': instance.name,
      'banner': instance.banner,
      'menu': instance.menu,
      'pics': instance.pics,
      'blockedUsers': instance.blockedUsers,
      'location': instance.location?.toJson(),
      'prefs': instance.prefs?.toJson(),
    };
