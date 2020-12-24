// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    displayName: json['displayName'] as String,
    email: json['email'] as String,
    photoUrl: json['photoUrl'] as String,
    blockedStores: (json['blockedStores'] as Map<String, dynamic>)?.map(
          (k, e) => MapEntry(k, e as bool),
        ) ??
        {},
    lastActive: const TimestampConverter().fromJson(json['lastActive']),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'blockedStores': instance.blockedStores,
      'lastActive': const TimestampConverter().toJson(instance.lastActive),
    };
