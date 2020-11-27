// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'location_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LocationFormStateTearOff {
  const _$LocationFormStateTearOff();

// ignore: unused_element
  _LocationFormState call({@required StoreLocation location}) {
    return _LocationFormState(
      location: location,
    );
  }
}

// ignore: unused_element
const $LocationFormState = _$LocationFormStateTearOff();

mixin _$LocationFormState {
  StoreLocation get location;

  $LocationFormStateCopyWith<LocationFormState> get copyWith;
}

abstract class $LocationFormStateCopyWith<$Res> {
  factory $LocationFormStateCopyWith(
          LocationFormState value, $Res Function(LocationFormState) then) =
      _$LocationFormStateCopyWithImpl<$Res>;
  $Res call({StoreLocation location});

  $StoreLocationCopyWith<$Res> get location;
}

class _$LocationFormStateCopyWithImpl<$Res>
    implements $LocationFormStateCopyWith<$Res> {
  _$LocationFormStateCopyWithImpl(this._value, this._then);

  final LocationFormState _value;
  // ignore: unused_field
  final $Res Function(LocationFormState) _then;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(_value.copyWith(
      location:
          location == freezed ? _value.location : location as StoreLocation,
    ));
  }

  @override
  $StoreLocationCopyWith<$Res> get location {
    if (_value.location == null) {
      return null;
    }
    return $StoreLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

abstract class _$LocationFormStateCopyWith<$Res>
    implements $LocationFormStateCopyWith<$Res> {
  factory _$LocationFormStateCopyWith(
          _LocationFormState value, $Res Function(_LocationFormState) then) =
      __$LocationFormStateCopyWithImpl<$Res>;
  @override
  $Res call({StoreLocation location});

  @override
  $StoreLocationCopyWith<$Res> get location;
}

class __$LocationFormStateCopyWithImpl<$Res>
    extends _$LocationFormStateCopyWithImpl<$Res>
    implements _$LocationFormStateCopyWith<$Res> {
  __$LocationFormStateCopyWithImpl(
      _LocationFormState _value, $Res Function(_LocationFormState) _then)
      : super(_value, (v) => _then(v as _LocationFormState));

  @override
  _LocationFormState get _value => super._value as _LocationFormState;

  @override
  $Res call({
    Object location = freezed,
  }) {
    return _then(_LocationFormState(
      location:
          location == freezed ? _value.location : location as StoreLocation,
    ));
  }
}

class _$_LocationFormState
    with DiagnosticableTreeMixin
    implements _LocationFormState {
  const _$_LocationFormState({@required this.location})
      : assert(location != null);

  @override
  final StoreLocation location;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocationFormState(location: $location)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocationFormState'))
      ..add(DiagnosticsProperty('location', location));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LocationFormState &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(location);

  @override
  _$LocationFormStateCopyWith<_LocationFormState> get copyWith =>
      __$LocationFormStateCopyWithImpl<_LocationFormState>(this, _$identity);
}

abstract class _LocationFormState implements LocationFormState {
  const factory _LocationFormState({@required StoreLocation location}) =
      _$_LocationFormState;

  @override
  StoreLocation get location;
  @override
  _$LocationFormStateCopyWith<_LocationFormState> get copyWith;
}
