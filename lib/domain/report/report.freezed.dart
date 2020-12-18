// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ReportTearOff {
  const _$ReportTearOff();

// ignore: unused_element
  _User user(
      {@required UniqueId userId,
      @required UniqueId reporter,
      @required String description}) {
    return _User(
      userId: userId,
      reporter: reporter,
      description: description,
    );
  }

// ignore: unused_element
  _Store store(
      {@required UniqueId storeId,
      @required UniqueId reporter,
      @required String description}) {
    return _Store(
      storeId: storeId,
      reporter: reporter,
      description: description,
    );
  }
}

// ignore: unused_element
const $Report = _$ReportTearOff();

mixin _$Report {
  UniqueId get reporter;
  String get description;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result user(UniqueId userId, UniqueId reporter, String description),
    @required
        Result store(UniqueId storeId, UniqueId reporter, String description),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result user(UniqueId userId, UniqueId reporter, String description),
    Result store(UniqueId storeId, UniqueId reporter, String description),
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

  $ReportCopyWith<Report> get copyWith;
}

abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res>;
  $Res call({UniqueId reporter, String description});
}

class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  final Report _value;
  // ignore: unused_field
  final $Res Function(Report) _then;

  @override
  $Res call({
    Object reporter = freezed,
    Object description = freezed,
  }) {
    return _then(_value.copyWith(
      reporter: reporter == freezed ? _value.reporter : reporter as UniqueId,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId userId, UniqueId reporter, String description});
}

class __$UserCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object userId = freezed,
    Object reporter = freezed,
    Object description = freezed,
  }) {
    return _then(_User(
      userId: userId == freezed ? _value.userId : userId as UniqueId,
      reporter: reporter == freezed ? _value.reporter : reporter as UniqueId,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {@required this.userId,
      @required this.reporter,
      @required this.description})
      : assert(userId != null),
        assert(reporter != null),
        assert(description != null);

  @override
  final UniqueId userId;
  @override
  final UniqueId reporter;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Report.user(userId: $userId, reporter: $reporter, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Report.user'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('reporter', reporter))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.reporter, reporter) ||
                const DeepCollectionEquality()
                    .equals(other.reporter, reporter)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(reporter) ^
      const DeepCollectionEquality().hash(description);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result user(UniqueId userId, UniqueId reporter, String description),
    @required
        Result store(UniqueId storeId, UniqueId reporter, String description),
  }) {
    assert(user != null);
    assert(store != null);
    return user(userId, reporter, description);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result user(UniqueId userId, UniqueId reporter, String description),
    Result store(UniqueId storeId, UniqueId reporter, String description),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (user != null) {
      return user(userId, reporter, description);
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
}

abstract class _User implements Report {
  const factory _User(
      {@required UniqueId userId,
      @required UniqueId reporter,
      @required String description}) = _$_User;

  UniqueId get userId;
  @override
  UniqueId get reporter;
  @override
  String get description;
  @override
  _$UserCopyWith<_User> get copyWith;
}

abstract class _$StoreCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) then) =
      __$StoreCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId storeId, UniqueId reporter, String description});
}

class __$StoreCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(_Store _value, $Res Function(_Store) _then)
      : super(_value, (v) => _then(v as _Store));

  @override
  _Store get _value => super._value as _Store;

  @override
  $Res call({
    Object storeId = freezed,
    Object reporter = freezed,
    Object description = freezed,
  }) {
    return _then(_Store(
      storeId: storeId == freezed ? _value.storeId : storeId as UniqueId,
      reporter: reporter == freezed ? _value.reporter : reporter as UniqueId,
      description:
          description == freezed ? _value.description : description as String,
    ));
  }
}

class _$_Store with DiagnosticableTreeMixin implements _Store {
  const _$_Store(
      {@required this.storeId,
      @required this.reporter,
      @required this.description})
      : assert(storeId != null),
        assert(reporter != null),
        assert(description != null);

  @override
  final UniqueId storeId;
  @override
  final UniqueId reporter;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Report.store(storeId: $storeId, reporter: $reporter, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Report.store'))
      ..add(DiagnosticsProperty('storeId', storeId))
      ..add(DiagnosticsProperty('reporter', reporter))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Store &&
            (identical(other.storeId, storeId) ||
                const DeepCollectionEquality()
                    .equals(other.storeId, storeId)) &&
            (identical(other.reporter, reporter) ||
                const DeepCollectionEquality()
                    .equals(other.reporter, reporter)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(storeId) ^
      const DeepCollectionEquality().hash(reporter) ^
      const DeepCollectionEquality().hash(description);

  @override
  _$StoreCopyWith<_Store> get copyWith =>
      __$StoreCopyWithImpl<_Store>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result user(UniqueId userId, UniqueId reporter, String description),
    @required
        Result store(UniqueId storeId, UniqueId reporter, String description),
  }) {
    assert(user != null);
    assert(store != null);
    return store(storeId, reporter, description);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result user(UniqueId userId, UniqueId reporter, String description),
    Result store(UniqueId storeId, UniqueId reporter, String description),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (store != null) {
      return store(storeId, reporter, description);
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
}

abstract class _Store implements Report {
  const factory _Store(
      {@required UniqueId storeId,
      @required UniqueId reporter,
      @required String description}) = _$_Store;

  UniqueId get storeId;
  @override
  UniqueId get reporter;
  @override
  String get description;
  @override
  _$StoreCopyWith<_Store> get copyWith;
}
