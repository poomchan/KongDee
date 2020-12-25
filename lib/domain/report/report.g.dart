// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    userId: json['userId'] as String,
    reporter: json['reporter'] as String,
    description: json['description'] as String,
    recieve: json['recieve'] as bool,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'reporter': instance.reporter,
      'description': instance.description,
      'recieve': instance.recieve,
    };

_$_Store _$_$_StoreFromJson(Map<String, dynamic> json) {
  return _$_Store(
    id: json['id'] as String,
    storeId: json['storeId'] as String,
    reporter: json['reporter'] as String,
    description: json['description'] as String,
    recieve: json['recieve'] as bool,
  );
}

Map<String, dynamic> _$_$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'id': instance.id,
      'storeId': instance.storeId,
      'reporter': instance.reporter,
      'description': instance.description,
      'recieve': instance.recieve,
    };
