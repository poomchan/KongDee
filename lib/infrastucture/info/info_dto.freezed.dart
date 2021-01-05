// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
InfoDto _$InfoDtoFromJson(Map<String, dynamic> json) {
  return _InfoDto.fromJson(json);
}

class _$InfoDtoTearOff {
  const _$InfoDtoTearOff();

// ignore: unused_element
  _InfoDto call({String id, @required String body, @required String title}) {
    return _InfoDto(
      id: id,
      body: body,
      title: title,
    );
  }
}

// ignore: unused_element
const $InfoDto = _$InfoDtoTearOff();

mixin _$InfoDto {
  String get id;
  String get body;
  String get title;

  Map<String, dynamic> toJson();
  $InfoDtoCopyWith<InfoDto> get copyWith;
}

abstract class $InfoDtoCopyWith<$Res> {
  factory $InfoDtoCopyWith(InfoDto value, $Res Function(InfoDto) then) =
      _$InfoDtoCopyWithImpl<$Res>;
  $Res call({String id, String body, String title});
}

class _$InfoDtoCopyWithImpl<$Res> implements $InfoDtoCopyWith<$Res> {
  _$InfoDtoCopyWithImpl(this._value, this._then);

  final InfoDto _value;
  // ignore: unused_field
  final $Res Function(InfoDto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object body = freezed,
    Object title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      body: body == freezed ? _value.body : body as String,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

abstract class _$InfoDtoCopyWith<$Res> implements $InfoDtoCopyWith<$Res> {
  factory _$InfoDtoCopyWith(_InfoDto value, $Res Function(_InfoDto) then) =
      __$InfoDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String body, String title});
}

class __$InfoDtoCopyWithImpl<$Res> extends _$InfoDtoCopyWithImpl<$Res>
    implements _$InfoDtoCopyWith<$Res> {
  __$InfoDtoCopyWithImpl(_InfoDto _value, $Res Function(_InfoDto) _then)
      : super(_value, (v) => _then(v as _InfoDto));

  @override
  _InfoDto get _value => super._value as _InfoDto;

  @override
  $Res call({
    Object id = freezed,
    Object body = freezed,
    Object title = freezed,
  }) {
    return _then(_InfoDto(
      id: id == freezed ? _value.id : id as String,
      body: body == freezed ? _value.body : body as String,
      title: title == freezed ? _value.title : title as String,
    ));
  }
}

@JsonSerializable()
class _$_InfoDto extends _InfoDto {
  const _$_InfoDto({this.id, @required this.body, @required this.title})
      : assert(body != null),
        assert(title != null),
        super._();

  factory _$_InfoDto.fromJson(Map<String, dynamic> json) =>
      _$_$_InfoDtoFromJson(json);

  @override
  final String id;
  @override
  final String body;
  @override
  final String title;

  @override
  String toString() {
    return 'InfoDto(id: $id, body: $body, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InfoDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(title);

  @override
  _$InfoDtoCopyWith<_InfoDto> get copyWith =>
      __$InfoDtoCopyWithImpl<_InfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_InfoDtoToJson(this);
  }
}

abstract class _InfoDto extends InfoDto {
  const _InfoDto._() : super._();
  const factory _InfoDto(
      {String id, @required String body, @required String title}) = _$_InfoDto;

  factory _InfoDto.fromJson(Map<String, dynamic> json) = _$_InfoDto.fromJson;

  @override
  String get id;
  @override
  String get body;
  @override
  String get title;
  @override
  _$InfoDtoCopyWith<_InfoDto> get copyWith;
}
