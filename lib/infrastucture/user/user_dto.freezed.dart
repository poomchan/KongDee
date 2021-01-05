// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

class _$UserDtoTearOff {
  const _$UserDtoTearOff();

// ignore: unused_element
  _UserDto call(
      {@required String id,
      @required String displayName,
      @required String email,
      @required String photoUrl,
      @required Map<String, bool> blockedStores,
      @required @TimestampConverter() Timestamp lastActive}) {
    return _UserDto(
      id: id,
      displayName: displayName,
      email: email,
      photoUrl: photoUrl,
      blockedStores: blockedStores,
      lastActive: lastActive,
    );
  }
}

// ignore: unused_element
const $UserDto = _$UserDtoTearOff();

mixin _$UserDto {
  String get id;
  String get displayName;
  String get email;
  String get photoUrl;
  Map<String, bool> get blockedStores;
  @TimestampConverter()
  Timestamp get lastActive;

  Map<String, dynamic> toJson();
  $UserDtoCopyWith<UserDto> get copyWith;
}

abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String displayName,
      String email,
      String photoUrl,
      Map<String, bool> blockedStores,
      @TimestampConverter() Timestamp lastActive});
}

class _$UserDtoCopyWithImpl<$Res> implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  final UserDto _value;
  // ignore: unused_field
  final $Res Function(UserDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object displayName = freezed,
    Object email = freezed,
    Object photoUrl = freezed,
    Object blockedStores = freezed,
    Object lastActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      email: email == freezed ? _value.email : email as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      blockedStores: blockedStores == freezed
          ? _value.blockedStores
          : blockedStores as Map<String, bool>,
      lastActive:
          lastActive == freezed ? _value.lastActive : lastActive as Timestamp,
    ));
  }
}

abstract class _$UserDtoCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$UserDtoCopyWith(_UserDto value, $Res Function(_UserDto) then) =
      __$UserDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String displayName,
      String email,
      String photoUrl,
      Map<String, bool> blockedStores,
      @TimestampConverter() Timestamp lastActive});
}

class __$UserDtoCopyWithImpl<$Res> extends _$UserDtoCopyWithImpl<$Res>
    implements _$UserDtoCopyWith<$Res> {
  __$UserDtoCopyWithImpl(_UserDto _value, $Res Function(_UserDto) _then)
      : super(_value, (v) => _then(v as _UserDto));

  @override
  _UserDto get _value => super._value as _UserDto;

  @override
  $Res call({
    Object id = freezed,
    Object displayName = freezed,
    Object email = freezed,
    Object photoUrl = freezed,
    Object blockedStores = freezed,
    Object lastActive = freezed,
  }) {
    return _then(_UserDto(
      id: id == freezed ? _value.id : id as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      email: email == freezed ? _value.email : email as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      blockedStores: blockedStores == freezed
          ? _value.blockedStores
          : blockedStores as Map<String, bool>,
      lastActive:
          lastActive == freezed ? _value.lastActive : lastActive as Timestamp,
    ));
  }
}

@JsonSerializable()
class _$_UserDto extends _UserDto {
  const _$_UserDto(
      {@required this.id,
      @required this.displayName,
      @required this.email,
      @required this.photoUrl,
      @required this.blockedStores,
      @required @TimestampConverter() this.lastActive})
      : assert(id != null),
        assert(displayName != null),
        assert(email != null),
        assert(photoUrl != null),
        assert(blockedStores != null),
        assert(lastActive != null),
        super._();

  factory _$_UserDto.fromJson(Map<String, dynamic> json) =>
      _$_$_UserDtoFromJson(json);

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String photoUrl;
  @override
  final Map<String, bool> blockedStores;
  @override
  @TimestampConverter()
  final Timestamp lastActive;

  @override
  String toString() {
    return 'UserDto(id: $id, displayName: $displayName, email: $email, photoUrl: $photoUrl, blockedStores: $blockedStores, lastActive: $lastActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.blockedStores, blockedStores) ||
                const DeepCollectionEquality()
                    .equals(other.blockedStores, blockedStores)) &&
            (identical(other.lastActive, lastActive) ||
                const DeepCollectionEquality()
                    .equals(other.lastActive, lastActive)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(blockedStores) ^
      const DeepCollectionEquality().hash(lastActive);

  @override
  _$UserDtoCopyWith<_UserDto> get copyWith =>
      __$UserDtoCopyWithImpl<_UserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserDtoToJson(this);
  }
}

abstract class _UserDto extends UserDto {
  const _UserDto._() : super._();
  const factory _UserDto(
      {@required String id,
      @required String displayName,
      @required String email,
      @required String photoUrl,
      @required Map<String, bool> blockedStores,
      @required @TimestampConverter() Timestamp lastActive}) = _$_UserDto;

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$_UserDto.fromJson;

  @override
  String get id;
  @override
  String get displayName;
  @override
  String get email;
  @override
  String get photoUrl;
  @override
  Map<String, bool> get blockedStores;
  @override
  @TimestampConverter()
  Timestamp get lastActive;
  @override
  _$UserDtoCopyWith<_UserDto> get copyWith;
}
