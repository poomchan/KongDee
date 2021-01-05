// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$InfoDomainTearOff {
  const _$InfoDomainTearOff();

// ignore: unused_element
  _InfoDomain call(
      {@required UniqueId id, @required String title, @required String body}) {
    return _InfoDomain(
      id: id,
      title: title,
      body: body,
    );
  }
}

// ignore: unused_element
const $InfoDomain = _$InfoDomainTearOff();

mixin _$InfoDomain {
  UniqueId get id;
  String get title;
  String get body;

  $InfoDomainCopyWith<InfoDomain> get copyWith;
}

abstract class $InfoDomainCopyWith<$Res> {
  factory $InfoDomainCopyWith(
          InfoDomain value, $Res Function(InfoDomain) then) =
      _$InfoDomainCopyWithImpl<$Res>;
  $Res call({UniqueId id, String title, String body});
}

class _$InfoDomainCopyWithImpl<$Res> implements $InfoDomainCopyWith<$Res> {
  _$InfoDomainCopyWithImpl(this._value, this._then);

  final InfoDomain _value;
  // ignore: unused_field
  final $Res Function(InfoDomain) _then;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object body = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      title: title == freezed ? _value.title : title as String,
      body: body == freezed ? _value.body : body as String,
    ));
  }
}

abstract class _$InfoDomainCopyWith<$Res> implements $InfoDomainCopyWith<$Res> {
  factory _$InfoDomainCopyWith(
          _InfoDomain value, $Res Function(_InfoDomain) then) =
      __$InfoDomainCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, String title, String body});
}

class __$InfoDomainCopyWithImpl<$Res> extends _$InfoDomainCopyWithImpl<$Res>
    implements _$InfoDomainCopyWith<$Res> {
  __$InfoDomainCopyWithImpl(
      _InfoDomain _value, $Res Function(_InfoDomain) _then)
      : super(_value, (v) => _then(v as _InfoDomain));

  @override
  _InfoDomain get _value => super._value as _InfoDomain;

  @override
  $Res call({
    Object id = freezed,
    Object title = freezed,
    Object body = freezed,
  }) {
    return _then(_InfoDomain(
      id: id == freezed ? _value.id : id as UniqueId,
      title: title == freezed ? _value.title : title as String,
      body: body == freezed ? _value.body : body as String,
    ));
  }
}

class _$_InfoDomain extends _InfoDomain {
  const _$_InfoDomain(
      {@required this.id, @required this.title, @required this.body})
      : assert(id != null),
        assert(title != null),
        assert(body != null),
        super._();

  @override
  final UniqueId id;
  @override
  final String title;
  @override
  final String body;

  @override
  String toString() {
    return 'InfoDomain(id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InfoDomain &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body);

  @override
  _$InfoDomainCopyWith<_InfoDomain> get copyWith =>
      __$InfoDomainCopyWithImpl<_InfoDomain>(this, _$identity);
}

abstract class _InfoDomain extends InfoDomain {
  const _InfoDomain._() : super._();
  const factory _InfoDomain(
      {@required UniqueId id,
      @required String title,
      @required String body}) = _$_InfoDomain;

  @override
  UniqueId get id;
  @override
  String get title;
  @override
  String get body;
  @override
  _$InfoDomainCopyWith<_InfoDomain> get copyWith;
}
