// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreLocation _$_$_StoreLocationFromJson(Map<String, dynamic> json) {
  return _$_StoreLocation(
    address: json['address'] as String ?? '',
    geoFirePoint: const GeoFirePointConverter().fromJson(json['geoFirePoint']),
  );
}

Map<String, dynamic> _$_$_StoreLocationToJson(_$_StoreLocation instance) =>
    <String, dynamic>{
      'address': instance.address,
      'geoFirePoint':
          const GeoFirePointConverter().toJson(instance.geoFirePoint),
    };
