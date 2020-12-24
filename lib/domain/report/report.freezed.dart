// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Report _$ReportFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'user':
      return _User.fromJson(json);
    case 'store':
      return _Store.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$ReportTearOff {
  const _$ReportTearOff();

// ignore: unused_element
  _User user(
      {@required String id,
      @required String userId,
      @required String reporter,
      @required String description,
      @required bool recieve}) {
    return _User(
      id: id,
      userId: userId,
      reporter: reporter,
      description: description,
      recieve: recieve,
    );
  }

// ignore: unused_element
  _Store store(
      {@required String id,
      @required String storeId,
      @required String reporter,
      @required String description,
      @required bool recieve}) {
    return _Store(
      id: id,
      storeId: storeId,
      reporter: reporter,
      description: description,
      recieve: recieve,
    );
  }
}

// ignore: unused_element
const $Report = _$ReportTearOff();

mixin _$Report {
  String get id;
  String get reporter;
  String get description;
  bool get recieve;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result user(String id, String userId, String reporter,
            String description, bool recieve),
    @required
        Result store(String id, String storeId, String reporter,
            String description, bool recieve),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result user(String id, String userId, String reporter, String description,
        bool recieve),
    Result store(String id, String storeId, String reporter, String description,
        bool recieve),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result user(_User value),
    @required Result store(_Store value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result user(_User value),
    Result store(_Store value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
  $ReportCopyWith<Report> get copyWith;
}

abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res>;
  $Res call({String id, String reporter, String description, bool recieve});
}

class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  final Report _value;
  // ignore: unused_field
  final $Res Function(Report) _then;

  @override
  $Res call({
    Object id = freezed,
    Object reporter = freezed,
    Object description = freezed,
    Object recieve = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      reporter: reporter == freezed ? _value.reporter : reporter as String,
      description:
          description == freezed ? _value.description : description as String,
      recieve: recieve == freezed ? _value.recieve : recieve as bool,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String userId,
      String reporter,
      String description,
      bool recieve});
}

class __$UserCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object id = freezed,
    Object userId = freezed,
    Object reporter = freezed,
    Object description = freezed,
    Object recieve = freezed,
  }) {
    return _then(_User(
      id: id == freezed ? _value.id : id as String,
      userId: userId == freezed ? _value.userId : userId as String,
      reporter: reporter == freezed ? _value.reporter : reporter as String,
      description:
          description == freezed ? _value.description : description as String,
      recieve: recieve == freezed ? _value.recieve : recieve as bool,
    ));
  }
}

@JsonSerializable()
class _$_User extends _User with DiagnosticableTreeMixin {
  const _$_User(
      {@required this.id,
      @required this.userId,
      @required this.reporter,
      @required this.description,
      @required this.recieve})
      : assert(id != null),
        assert(userId != null),
        assert(reporter != null),
        assert(description != null),
        assert(recieve != null),
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String reporter;
  @override
  final String description;
  @override
  final bool recieve;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Report.user(id: $id, userId: $userId, reporter: $reporter, description: $description, recieve: $recieve)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Report.user'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('reporter', reporter))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('recieve', recieve));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.reporter, reporter) ||
                const DeepCollectionEquality()
                    .equals(other.reporter, reporter)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.recieve, recieve) ||
                const DeepCollectionEquality().equals(other.recieve, recieve)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(reporter) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(recieve);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result user(String id, String userId, String reporter,
            String description, bool recieve),
    @required
        Result store(String id, String storeId, String reporter,
            String description, bool recieve),
  }) {
    assert(user != null);
    assert(store != null);
    return user(id, userId, reporter, description, recieve);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result user(String id, String userId, String reporter, String description,
        bool recieve),
    Result store(String id, String storeId, String reporter, String description,
        bool recieve),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (user != null) {
      return user(id, userId, reporter, description, recieve);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result user(_User value),
    @required Result store(_Store value),
  }) {
    assert(user != null);
    assert(store != null);
    return user(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result user(_User value),
    Result store(_Store value),
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
    return _$_$_UserToJson(this)..['runtimeType'] = 'user';
  }
}

abstract class _User extends Report {
  const _User._() : super._();
  const factory _User(
      {@required String id,
      @required String userId,
      @required String reporter,
      @required String description,
      @required bool recieve}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id;
  String get userId;
  @override
  String get reporter;
  @override
  String get description;
  @override
  bool get recieve;
  @override
  _$UserCopyWith<_User> get copyWith;
}

abstract class _$StoreCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) then) =
      __$StoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String storeId,
      String reporter,
      String description,
      bool recieve});
}

class __$StoreCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(_Store _value, $Res Function(_Store) _then)
      : super(_value, (v) => _then(v as _Store));

  @override
  _Store get _value => super._value as _Store;

  @override
  $Res call({
    Object id = freezed,
    Object storeId = freezed,
    Object reporter = freezed,
    Object description = freezed,
    Object recieve = freezed,
  }) {
    return _then(_Store(
      id: id == freezed ? _value.id : id as String,
      storeId: storeId == freezed ? _value.storeId : storeId as String,
      reporter: reporter == freezed ? _value.reporter : reporter as String,
      description:
          description == freezed ? _value.description : description as String,
      recieve: recieve == freezed ? _value.recieve : recieve as bool,
    ));
  }
}

@JsonSerializable()
class _$_Store extends _Store with DiagnosticableTreeMixin {
  const _$_Store(
      {@required this.id,
      @required this.storeId,
      @required this.reporter,
      @required this.description,
      @required this.recieve})
      : assert(id != null),
        assert(storeId != null),
        assert(reporter != null),
        assert(description != null),
        assert(recieve != null),
        super._();

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreFromJson(json);

  @override
  final String id;
  @override
  final String storeId;
  @override
  final String reporter;
  @override
  final String description;
  @override
  final bool recieve;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Report.store(id: $id, storeId: $storeId, reporter: $reporter, description: $description, recieve: $recieve)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Report.store'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('storeId', storeId))
      ..add(DiagnosticsProperty('reporter', reporter))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('recieve', recieve));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Store &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.storeId, storeId) ||
                const DeepCollectionEquality()
                    .equals(other.storeId, storeId)) &&
            (identical(other.reporter, reporter) ||
                const DeepCollectionEquality()
                    .equals(other.reporter, reporter)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.recieve, recieve) ||
                const DeepCollectionEquality().equals(other.recieve, recieve)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(storeId) ^
      const DeepCollectionEquality().hash(reporter) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(recieve);

  @override
  _$StoreCopyWith<_Store> get copyWith =>
      __$StoreCopyWithImpl<_Store>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result user(String id, String userId, String reporter,
            String description, bool recieve),
    @required
        Result store(String id, String storeId, String reporter,
            String description, bool recieve),
  }) {
    assert(user != null);
    assert(store != null);
    return store(id, storeId, reporter, description, recieve);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result user(String id, String userId, String reporter, String description,
        bool recieve),
    Result store(String id, String storeId, String reporter, String description,
        bool recieve),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (store != null) {
      return store(id, storeId, reporter, description, recieve);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result user(_User value),
    @required Result store(_Store value),
  }) {
    assert(user != null);
    assert(store != null);
    return store(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result user(_User value),
    Result store(_Store value),
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
    return _$_$_StoreToJson(this)..['runtimeType'] = 'store';
  }
}

abstract class _Store extends Report {
  const _Store._() : super._();
  const factory _Store(
      {@required String id,
      @required String storeId,
      @required String reporter,
      @required String description,
      @required bool recieve}) = _$_Store;

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  String get id;
  String get storeId;
  @override
  String get reporter;
  @override
  String get description;
  @override
  bool get recieve;
  @override
  _$StoreCopyWith<_Store> get copyWith;
}
