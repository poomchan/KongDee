// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserDomainTearOff {
  const _$UserDomainTearOff();

// ignore: unused_element
  _User call(
      {@required UniqueId id,
      @required String displayName,
      @required String email,
      @required String photoURL}) {
    return _User(
      id: id,
      displayName: displayName,
      email: email,
      photoURL: photoURL,
    );
  }
}

// ignore: unused_element
const $UserDomain = _$UserDomainTearOff();

mixin _$UserDomain {
  UniqueId get id;
  String get displayName;
  String get email;
  String get photoURL;

  $UserDomainCopyWith<UserDomain> get copyWith;
}

abstract class $UserDomainCopyWith<$Res> {
  factory $UserDomainCopyWith(
          UserDomain value, $Res Function(UserDomain) then) =
      _$UserDomainCopyWithImpl<$Res>;
  $Res call({UniqueId id, String displayName, String email, String photoURL});
}

class _$UserDomainCopyWithImpl<$Res> implements $UserDomainCopyWith<$Res> {
  _$UserDomainCopyWithImpl(this._value, this._then);

  final UserDomain _value;
  // ignore: unused_field
  final $Res Function(UserDomain) _then;

  @override
  $Res call({
    Object id = freezed,
    Object displayName = freezed,
    Object email = freezed,
    Object photoURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      email: email == freezed ? _value.email : email as String,
      photoURL: photoURL == freezed ? _value.photoURL : photoURL as String,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserDomainCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, String displayName, String email, String photoURL});
}

class __$UserCopyWithImpl<$Res> extends _$UserDomainCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object id = freezed,
    Object displayName = freezed,
    Object email = freezed,
    Object photoURL = freezed,
  }) {
    return _then(_User(
      id: id == freezed ? _value.id : id as UniqueId,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      email: email == freezed ? _value.email : email as String,
      photoURL: photoURL == freezed ? _value.photoURL : photoURL as String,
    ));
  }
}

class _$_User implements _User {
  const _$_User(
      {@required this.id,
      @required this.displayName,
      @required this.email,
      @required this.photoURL})
      : assert(id != null),
        assert(displayName != null),
        assert(email != null),
        assert(photoURL != null);

  @override
  final UniqueId id;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String photoURL;

  @override
  String toString() {
    return 'UserDomain(id: $id, displayName: $displayName, email: $email, photoURL: $photoURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.photoURL, photoURL) ||
                const DeepCollectionEquality()
                    .equals(other.photoURL, photoURL)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(photoURL);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User implements UserDomain {
  const factory _User(
      {@required UniqueId id,
      @required String displayName,
      @required String email,
      @required String photoURL}) = _$_User;

  @override
  UniqueId get id;
  @override
  String get displayName;
  @override
  String get email;
  @override
  String get photoURL;
  @override
  _$UserCopyWith<_User> get copyWith;
}
