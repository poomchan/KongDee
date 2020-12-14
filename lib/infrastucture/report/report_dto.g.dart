// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserReportDto _$_$_UserReportDtoFromJson(Map<String, dynamic> json) {
  return _$_UserReportDto(
    type: json['type'] as String,
    userId: json['userId'] as String,
    reporter: json['reporter'] as String,
    description: json['description'] as String,
    received: json['received'] as bool,
    timestamp: const TimestampConverter().fromJson(json['timestamp']),
  );
}

Map<String, dynamic> _$_$_UserReportDtoToJson(_$_UserReportDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'userId': instance.userId,
      'reporter': instance.reporter,
      'description': instance.description,
      'received': instance.received,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };

_$_StoreReportDto _$_$_StoreReportDtoFromJson(Map<String, dynamic> json) {
  return _$_StoreReportDto(
    type: json['type'] as String,
    storeId: json['storeId'] as String,
    reporter: json['reporter'] as String,
    description: json['description'] as String,
    received: json['received'] as bool,
    timestamp: const TimestampConverter().fromJson(json['timestamp']),
  );
}

Map<String, dynamic> _$_$_StoreReportDtoToJson(_$_StoreReportDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'storeId': instance.storeId,
      'reporter': instance.reporter,
      'description': instance.description,
      'received': instance.received,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };
