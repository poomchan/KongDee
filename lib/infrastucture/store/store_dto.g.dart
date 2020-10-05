// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreDto _$_$_StoreDtoFromJson(Map<String, dynamic> json) {
  return _$_StoreDto(
    name: json['name'] as String,
    menu: json['menu'] as String,
    bannerUrl: json['bannerUrl'] as String,
    picUrls: (json['picUrls'] as List)?.map((e) => e as String)?.toList(),
    ownerId: json['ownerId'] as String,
    distanceAway: json['distanceAway'] as int,
    formattedAddress: json['formattedAddress'] as String,
    serverTimeStamp:
        const ServerTimestampConverter().fromJson(json['serverTimeStamp']),
  );
}

Map<String, dynamic> _$_$_StoreDtoToJson(_$_StoreDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'menu': instance.menu,
      'bannerUrl': instance.bannerUrl,
      'picUrls': instance.picUrls,
      'ownerId': instance.ownerId,
      'distanceAway': instance.distanceAway,
      'formattedAddress': instance.formattedAddress,
      'serverTimeStamp':
          const ServerTimestampConverter().toJson(instance.serverTimeStamp),
    };
