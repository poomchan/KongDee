// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ReportDto _$ReportDtoFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'user':
      return _UserReportDto.fromJson(json);
    case 'store':
      return _StoreReportDto.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$ReportDtoTearOff {
  const _$ReportDtoTearOff();

// ignore: unused_element
  _UserReportDto user(
      {@required String type,
      @required String userId,
      @required String reporter,
      @required String description,
      @required bool received,
      @required @TimestampConverter() Timestamp timestamp}) {
    return _UserReportDto(
      type: type,
      userId: userId,
      reporter: reporter,
      description: description,
      received: received,
      timestamp: timestamp,
    );
  }

// ignore: unused_element
  _StoreReportDto store(
      {@required String type,
      @required String storeId,
      @required String reporter,
      @required String description,
      @required bool received,
      @required @TimestampConverter() Timestamp timestamp}) {
    return _StoreReportDto(
      type: type,
      storeId: storeId,
      reporter: reporter,
      description: description,
      received: received,
      timestamp: timestamp,
    );
  }
}

// ignore: unused_element
const $ReportDto = _$ReportDtoTearOff();

mixin _$ReportDto {
  String get type;
  String get reporter;
  String get description;
  bool get received;
  @TimestampConverter()
  Timestamp get timestamp;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result user(
            String type,
            String userId,
            String reporter,
            String description,
            bool received,
            @TimestampConverter() Timestamp timestamp),
    @required
        Result store(
            String type,
            String storeId,
            String reporter,
            String description,
            bool received,
            @TimestampConverter() Timestamp timestamp),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result user(String type, String userId, String reporter, String description,
        bool received, @TimestampConverter() Timestamp timestamp),
    Result store(
        String type,
        String storeId,
        String reporter,
        String description,
        bool received,
        @TimestampConverter() Timestamp timestamp),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result user(_UserReportDto value),
    @required Result store(_StoreReportDto value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result user(_UserReportDto value),
    Result store(_StoreReportDto value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
  $ReportDtoCopyWith<ReportDto> get copyWith;
}

abstract class $ReportDtoCopyWith<$Res> {
  factory $ReportDtoCopyWith(ReportDto value, $Res Function(ReportDto) then) =
      _$ReportDtoCopyWithImpl<$Res>;
  $Res call(
      {String type,
      String reporter,
      String description,
      bool received,
      @TimestampConverter() Timestamp timestamp});
}

class _$ReportDtoCopyWithImpl<$Res> implements $ReportDtoCopyWith<$Res> {
  _$ReportDtoCopyWithImpl(this._value, this._then);

  final ReportDto _value;
  // ignore: unused_field
  final $Res Function(ReportDto) _then;

  @override
  $Res call({
    Object type = freezed,
    Object reporter = freezed,
    Object description = freezed,
    Object received = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as String,
      reporter: reporter == freezed ? _value.reporter : reporter as String,
      description:
          description == freezed ? _value.description : description as String,
      received: received == freezed ? _value.received : received as bool,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }
}

abstract class _$UserReportDtoCopyWith<$Res>
    implements $ReportDtoCopyWith<$Res> {
  factory _$UserReportDtoCopyWith(
          _UserReportDto value, $Res Function(_UserReportDto) then) =
      __$UserReportDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      String userId,
      String reporter,
      String description,
      bool received,
      @TimestampConverter() Timestamp timestamp});
}

class __$UserReportDtoCopyWithImpl<$Res> extends _$ReportDtoCopyWithImpl<$Res>
    implements _$UserReportDtoCopyWith<$Res> {
  __$UserReportDtoCopyWithImpl(
      _UserReportDto _value, $Res Function(_UserReportDto) _then)
      : super(_value, (v) => _then(v as _UserReportDto));

  @override
  _UserReportDto get _value => super._value as _UserReportDto;

  @override
  $Res call({
    Object type = freezed,
    Object userId = freezed,
    Object reporter = freezed,
    Object description = freezed,
    Object received = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_UserReportDto(
      type: type == freezed ? _value.type : type as String,
      userId: userId == freezed ? _value.userId : userId as String,
      reporter: reporter == freezed ? _value.reporter : reporter as String,
      description:
          description == freezed ? _value.description : description as String,
      received: received == freezed ? _value.received : received as bool,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }
}

@JsonSerializable()
class _$_UserReportDto extends _UserReportDto {
  const _$_UserReportDto(
      {@required this.type,
      @required this.userId,
      @required this.reporter,
      @required this.description,
      @required this.received,
      @required @TimestampConverter() this.timestamp})
      : assert(type != null),
        assert(userId != null),
        assert(reporter != null),
        assert(description != null),
        assert(received != null),
        assert(timestamp != null),
        super._();

  factory _$_UserReportDto.fromJson(Map<String, dynamic> json) =>
      _$_$_UserReportDtoFromJson(json);

  @override
  final String type;
  @override
  final String userId;
  @override
  final String reporter;
  @override
  final String description;
  @override
  final bool received;
  @override
  @TimestampConverter()
  final Timestamp timestamp;

  @override
  String toString() {
    return 'ReportDto.user(type: $type, userId: $userId, reporter: $reporter, description: $description, received: $received, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserReportDto &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.reporter, reporter) ||
                const DeepCollectionEquality()
                    .equals(other.reporter, reporter)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.received, received) ||
                const DeepCollectionEquality()
                    .equals(other.received, received)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(reporter) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(received) ^
      const DeepCollectionEquality().hash(timestamp);

  @override
  _$UserReportDtoCopyWith<_UserReportDto> get copyWith =>
      __$UserReportDtoCopyWithImpl<_UserReportDto>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result user(
            String type,
            String userId,
            String reporter,
            String description,
            bool received,
            @TimestampConverter() Timestamp timestamp),
    @required
        Result store(
            String type,
            String storeId,
            String reporter,
            String description,
            bool received,
            @TimestampConverter() Timestamp timestamp),
  }) {
    assert(user != null);
    assert(store != null);
    return user(type, userId, reporter, description, received, timestamp);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result user(String type, String userId, String reporter, String description,
        bool received, @TimestampConverter() Timestamp timestamp),
    Result store(
        String type,
        String storeId,
        String reporter,
        String description,
        bool received,
        @TimestampConverter() Timestamp timestamp),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (user != null) {
      return user(type, userId, reporter, description, received, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result user(_UserReportDto value),
    @required Result store(_StoreReportDto value),
  }) {
    assert(user != null);
    assert(store != null);
    return user(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result user(_UserReportDto value),
    Result store(_StoreReportDto value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (user != null) {
      return user(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserReportDtoToJson(this)..['runtimeType'] = 'user';
  }
}

abstract class _UserReportDto extends ReportDto {
  const _UserReportDto._() : super._();
  const factory _UserReportDto(
      {@required String type,
      @required String userId,
      @required String reporter,
      @required String description,
      @required bool received,
      @required @TimestampConverter() Timestamp timestamp}) = _$_UserReportDto;

  factory _UserReportDto.fromJson(Map<String, dynamic> json) =
      _$_UserReportDto.fromJson;

  @override
  String get type;
  String get userId;
  @override
  String get reporter;
  @override
  String get description;
  @override
  bool get received;
  @override
  @TimestampConverter()
  Timestamp get timestamp;
  @override
  _$UserReportDtoCopyWith<_UserReportDto> get copyWith;
}

abstract class _$StoreReportDtoCopyWith<$Res>
    implements $ReportDtoCopyWith<$Res> {
  factory _$StoreReportDtoCopyWith(
          _StoreReportDto value, $Res Function(_StoreReportDto) then) =
      __$StoreReportDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      String storeId,
      String reporter,
      String description,
      bool received,
      @TimestampConverter() Timestamp timestamp});
}

class __$StoreReportDtoCopyWithImpl<$Res> extends _$ReportDtoCopyWithImpl<$Res>
    implements _$StoreReportDtoCopyWith<$Res> {
  __$StoreReportDtoCopyWithImpl(
      _StoreReportDto _value, $Res Function(_StoreReportDto) _then)
      : super(_value, (v) => _then(v as _StoreReportDto));

  @override
  _StoreReportDto get _value => super._value as _StoreReportDto;

  @override
  $Res call({
    Object type = freezed,
    Object storeId = freezed,
    Object reporter = freezed,
    Object description = freezed,
    Object received = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_StoreReportDto(
      type: type == freezed ? _value.type : type as String,
      storeId: storeId == freezed ? _value.storeId : storeId as String,
      reporter: reporter == freezed ? _value.reporter : reporter as String,
      description:
          description == freezed ? _value.description : description as String,
      received: received == freezed ? _value.received : received as bool,
      timestamp:
          timestamp == freezed ? _value.timestamp : timestamp as Timestamp,
    ));
  }
}

@JsonSerializable()
class _$_StoreReportDto extends _StoreReportDto {
  const _$_StoreReportDto(
      {@required this.type,
      @required this.storeId,
      @required this.reporter,
      @required this.description,
      @required this.received,
      @required @TimestampConverter() this.timestamp})
      : assert(type != null),
        assert(storeId != null),
        assert(reporter != null),
        assert(description != null),
        assert(received != null),
        assert(timestamp != null),
        super._();

  factory _$_StoreReportDto.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreReportDtoFromJson(json);

  @override
  final String type;
  @override
  final String storeId;
  @override
  final String reporter;
  @override
  final String description;
  @override
  final bool received;
  @override
  @TimestampConverter()
  final Timestamp timestamp;

  @override
  String toString() {
    return 'ReportDto.store(type: $type, storeId: $storeId, reporter: $reporter, description: $description, received: $received, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StoreReportDto &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.storeId, storeId) ||
                const DeepCollectionEquality()
                    .equals(other.storeId, storeId)) &&
            (identical(other.reporter, reporter) ||
                const DeepCollectionEquality()
                    .equals(other.reporter, reporter)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.received, received) ||
                const DeepCollectionEquality()
                    .equals(other.received, received)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(storeId) ^
      const DeepCollectionEquality().hash(reporter) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(received) ^
      const DeepCollectionEquality().hash(timestamp);

  @override
  _$StoreReportDtoCopyWith<_StoreReportDto> get copyWith =>
      __$StoreReportDtoCopyWithImpl<_StoreReportDto>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result user(
            String type,
            String userId,
            String reporter,
            String description,
            bool received,
            @TimestampConverter() Timestamp timestamp),
    @required
        Result store(
            String type,
            String storeId,
            String reporter,
            String description,
            bool received,
            @TimestampConverter() Timestamp timestamp),
  }) {
    assert(user != null);
    assert(store != null);
    return store(type, storeId, reporter, description, received, timestamp);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result user(String type, String userId, String reporter, String description,
        bool received, @TimestampConverter() Timestamp timestamp),
    Result store(
        String type,
        String storeId,
        String reporter,
        String description,
        bool received,
        @TimestampConverter() Timestamp timestamp),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (store != null) {
      return store(type, storeId, reporter, description, received, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result user(_UserReportDto value),
    @required Result store(_StoreReportDto value),
  }) {
    assert(user != null);
    assert(store != null);
    return store(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result user(_UserReportDto value),
    Result store(_StoreReportDto value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (store != null) {
      return store(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreReportDtoToJson(this)..['runtimeType'] = 'store';
  }
}

abstract class _StoreReportDto extends ReportDto {
  const _StoreReportDto._() : super._();
  const factory _StoreReportDto(
      {@required String type,
      @required String storeId,
      @required String reporter,
      @required String description,
      @required bool received,
      @required @TimestampConverter() Timestamp timestamp}) = _$_StoreReportDto;

  factory _StoreReportDto.fromJson(Map<String, dynamic> json) =
      _$_StoreReportDto.fromJson;

  @override
  String get type;
  String get storeId;
  @override
  String get reporter;
  @override
  String get description;
  @override
  bool get received;
  @override
  @TimestampConverter()
  Timestamp get timestamp;
  @override
  _$StoreReportDtoCopyWith<_StoreReportDto> get copyWith;
}
