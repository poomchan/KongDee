// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreLocationDto _$_$_StoreLocationDtoFromJson(Map<String, dynamic> json) {
  return _$_StoreLocationDto(
    address: json['address'] as String,
    geoFirePoint: const GeoFirePointConverter().fromJson(json['geoFirePoint']),
  );
}

Map<String, dynamic> _$_$_StoreLocationDtoToJson(
        _$_StoreLocationDto instance) =>
    <String, dynamic>{
      'address': instance.address,
      'geoFirePoint':
          const GeoFirePointConverter().toJson(instance.geoFirePoint),
    };
