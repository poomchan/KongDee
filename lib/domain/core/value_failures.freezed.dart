// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'value_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

// ignore: unused_element
  ExceedingLength exceedingLength(dynamic failedValue, int max) {
    return ExceedingLength(
      failedValue,
      max,
    );
  }

// ignore: unused_element
  Empty empty(dynamic failedValue) {
    return Empty(
      failedValue,
    );
  }

// ignore: unused_element
  Multiline multiline(dynamic failedValue) {
    return Multiline(
      failedValue,
    );
  }

// ignore: unused_element
  ListTooLong listTooLong(dynamic failedValue, int max) {
    return ListTooLong(
      failedValue,
      max,
    );
  }

// ignore: unused_element
  InvalidEmail invalidEmail(dynamic failedValue) {
    return InvalidEmail(
      failedValue,
    );
  }

// ignore: unused_element
  ShortPassword shortPassword(dynamic failedValue) {
    return ShortPassword(
      failedValue,
    );
  }

// ignore: unused_element
  NumberNotPositive numberNotPositive(dynamic failedValue) {
    return NumberNotPositive(
      failedValue,
    );
  }

// ignore: unused_element
  NullValue nullValue() {
    return const NullValue();
  }
}

// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

mixin _$ValueFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(dynamic failedValue, int max),
    @required Result empty(dynamic failedValue),
    @required Result multiline(dynamic failedValue),
    @required Result listTooLong(dynamic failedValue, int max),
    @required Result invalidEmail(dynamic failedValue),
    @required Result shortPassword(dynamic failedValue),
    @required Result numberNotPositive(dynamic failedValue),
    @required Result nullValue(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(dynamic failedValue, int max),
    Result empty(dynamic failedValue),
    Result multiline(dynamic failedValue),
    Result listTooLong(dynamic failedValue, int max),
    Result invalidEmail(dynamic failedValue),
    Result shortPassword(dynamic failedValue),
    Result numberNotPositive(dynamic failedValue),
    Result nullValue(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength value),
    @required Result empty(Empty value),
    @required Result multiline(Multiline value),
    @required Result listTooLong(ListTooLong value),
    @required Result invalidEmail(InvalidEmail value),
    @required Result shortPassword(ShortPassword value),
    @required Result numberNotPositive(NumberNotPositive value),
    @required Result nullValue(NullValue value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength value),
    Result empty(Empty value),
    Result multiline(Multiline value),
    Result listTooLong(ListTooLong value),
    Result invalidEmail(InvalidEmail value),
    Result shortPassword(ShortPassword value),
    Result numberNotPositive(NumberNotPositive value),
    Result nullValue(NullValue value),
    @required Result orElse(),
  });
}

abstract class $ValueFailureCopyWith<$Res> {
  factory $ValueFailureCopyWith(
          ValueFailure value, $Res Function(ValueFailure) then) =
      _$ValueFailureCopyWithImpl<$Res>;
}

class _$ValueFailureCopyWithImpl<$Res> implements $ValueFailureCopyWith<$Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure _value;
  // ignore: unused_field
  final $Res Function(ValueFailure) _then;
}

abstract class $ExceedingLengthCopyWith<$Res> {
  factory $ExceedingLengthCopyWith(
          ExceedingLength value, $Res Function(ExceedingLength) then) =
      _$ExceedingLengthCopyWithImpl<$Res>;
  $Res call({dynamic failedValue, int max});
}

class _$ExceedingLengthCopyWithImpl<$Res>
    extends _$ValueFailureCopyWithImpl<$Res>
    implements $ExceedingLengthCopyWith<$Res> {
  _$ExceedingLengthCopyWithImpl(
      ExceedingLength _value, $Res Function(ExceedingLength) _then)
      : super(_value, (v) => _then(v as ExceedingLength));

  @override
  ExceedingLength get _value => super._value as ExceedingLength;

  @override
  $Res call({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _then(ExceedingLength(
      failedValue == freezed ? _value.failedValue : failedValue as dynamic,
      max == freezed ? _value.max : max as int,
    ));
  }
}

class _$ExceedingLength implements ExceedingLength {
  const _$ExceedingLength(this.failedValue, this.max)
      : assert(failedValue != null),
        assert(max != null);

  @override
  final dynamic failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'ValueFailure.exceedingLength(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExceedingLength &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(max);

  @override
  $ExceedingLengthCopyWith<ExceedingLength> get copyWith =>
      _$ExceedingLengthCopyWithImpl<ExceedingLength>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(dynamic failedValue, int max),
    @required Result empty(dynamic failedValue),
    @required Result multiline(dynamic failedValue),
    @required Result listTooLong(dynamic failedValue, int max),
    @required Result invalidEmail(dynamic failedValue),
    @required Result shortPassword(dynamic failedValue),
    @required Result numberNotPositive(dynamic failedValue),
    @required Result nullValue(),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return exceedingLength(failedValue, max);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(dynamic failedValue, int max),
    Result empty(dynamic failedValue),
    Result multiline(dynamic failedValue),
    Result listTooLong(dynamic failedValue, int max),
    Result invalidEmail(dynamic failedValue),
    Result shortPassword(dynamic failedValue),
    Result numberNotPositive(dynamic failedValue),
    Result nullValue(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exceedingLength != null) {
      return exceedingLength(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength value),
    @required Result empty(Empty value),
    @required Result multiline(Multiline value),
    @required Result listTooLong(ListTooLong value),
    @required Result invalidEmail(InvalidEmail value),
    @required Result shortPassword(ShortPassword value),
    @required Result numberNotPositive(NumberNotPositive value),
    @required Result nullValue(NullValue value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength value),
    Result empty(Empty value),
    Result multiline(Multiline value),
    Result listTooLong(ListTooLong value),
    Result invalidEmail(InvalidEmail value),
    Result shortPassword(ShortPassword value),
    Result numberNotPositive(NumberNotPositive value),
    Result nullValue(NullValue value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exceedingLength != null) {
      return exceedingLength(this);
    }
    return orElse();
  }
}

abstract class ExceedingLength implements ValueFailure {
  const factory ExceedingLength(dynamic failedValue, int max) =
      _$ExceedingLength;

  dynamic get failedValue;
  int get max;
  $ExceedingLengthCopyWith<ExceedingLength> get copyWith;
}

abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
  $Res call({dynamic failedValue});
}

class _$EmptyCopyWithImpl<$Res> extends _$ValueFailureCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(Empty(
      failedValue == freezed ? _value.failedValue : failedValue as dynamic,
    ));
  }
}

class _$Empty implements Empty {
  const _$Empty(this.failedValue) : assert(failedValue != null);

  @override
  final dynamic failedValue;

  @override
  String toString() {
    return 'ValueFailure.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Empty &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $EmptyCopyWith<Empty> get copyWith =>
      _$EmptyCopyWithImpl<Empty>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(dynamic failedValue, int max),
    @required Result empty(dynamic failedValue),
    @required Result multiline(dynamic failedValue),
    @required Result listTooLong(dynamic failedValue, int max),
    @required Result invalidEmail(dynamic failedValue),
    @required Result shortPassword(dynamic failedValue),
    @required Result numberNotPositive(dynamic failedValue),
    @required Result nullValue(),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(dynamic failedValue, int max),
    Result empty(dynamic failedValue),
    Result multiline(dynamic failedValue),
    Result listTooLong(dynamic failedValue, int max),
    Result invalidEmail(dynamic failedValue),
    Result shortPassword(dynamic failedValue),
    Result numberNotPositive(dynamic failedValue),
    Result nullValue(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength value),
    @required Result empty(Empty value),
    @required Result multiline(Multiline value),
    @required Result listTooLong(ListTooLong value),
    @required Result invalidEmail(InvalidEmail value),
    @required Result shortPassword(ShortPassword value),
    @required Result numberNotPositive(NumberNotPositive value),
    @required Result nullValue(NullValue value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength value),
    Result empty(Empty value),
    Result multiline(Multiline value),
    Result listTooLong(ListTooLong value),
    Result invalidEmail(InvalidEmail value),
    Result shortPassword(ShortPassword value),
    Result numberNotPositive(NumberNotPositive value),
    Result nullValue(NullValue value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements ValueFailure {
  const factory Empty(dynamic failedValue) = _$Empty;

  dynamic get failedValue;
  $EmptyCopyWith<Empty> get copyWith;
}

abstract class $MultilineCopyWith<$Res> {
  factory $MultilineCopyWith(Multiline value, $Res Function(Multiline) then) =
      _$MultilineCopyWithImpl<$Res>;
  $Res call({dynamic failedValue});
}

class _$MultilineCopyWithImpl<$Res> extends _$ValueFailureCopyWithImpl<$Res>
    implements $MultilineCopyWith<$Res> {
  _$MultilineCopyWithImpl(Multiline _value, $Res Function(Multiline) _then)
      : super(_value, (v) => _then(v as Multiline));

  @override
  Multiline get _value => super._value as Multiline;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(Multiline(
      failedValue == freezed ? _value.failedValue : failedValue as dynamic,
    ));
  }
}

class _$Multiline implements Multiline {
  const _$Multiline(this.failedValue) : assert(failedValue != null);

  @override
  final dynamic failedValue;

  @override
  String toString() {
    return 'ValueFailure.multiline(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Multiline &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $MultilineCopyWith<Multiline> get copyWith =>
      _$MultilineCopyWithImpl<Multiline>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(dynamic failedValue, int max),
    @required Result empty(dynamic failedValue),
    @required Result multiline(dynamic failedValue),
    @required Result listTooLong(dynamic failedValue, int max),
    @required Result invalidEmail(dynamic failedValue),
    @required Result shortPassword(dynamic failedValue),
    @required Result numberNotPositive(dynamic failedValue),
    @required Result nullValue(),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return multiline(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(dynamic failedValue, int max),
    Result empty(dynamic failedValue),
    Result multiline(dynamic failedValue),
    Result listTooLong(dynamic failedValue, int max),
    Result invalidEmail(dynamic failedValue),
    Result shortPassword(dynamic failedValue),
    Result numberNotPositive(dynamic failedValue),
    Result nullValue(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (multiline != null) {
      return multiline(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength value),
    @required Result empty(Empty value),
    @required Result multiline(Multiline value),
    @required Result listTooLong(ListTooLong value),
    @required Result invalidEmail(InvalidEmail value),
    @required Result shortPassword(ShortPassword value),
    @required Result numberNotPositive(NumberNotPositive value),
    @required Result nullValue(NullValue value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return multiline(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength value),
    Result empty(Empty value),
    Result multiline(Multiline value),
    Result listTooLong(ListTooLong value),
    Result invalidEmail(InvalidEmail value),
    Result shortPassword(ShortPassword value),
    Result numberNotPositive(NumberNotPositive value),
    Result nullValue(NullValue value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (multiline != null) {
      return multiline(this);
    }
    return orElse();
  }
}

abstract class Multiline implements ValueFailure {
  const factory Multiline(dynamic failedValue) = _$Multiline;

  dynamic get failedValue;
  $MultilineCopyWith<Multiline> get copyWith;
}

abstract class $ListTooLongCopyWith<$Res> {
  factory $ListTooLongCopyWith(
          ListTooLong value, $Res Function(ListTooLong) then) =
      _$ListTooLongCopyWithImpl<$Res>;
  $Res call({dynamic failedValue, int max});
}

class _$ListTooLongCopyWithImpl<$Res> extends _$ValueFailureCopyWithImpl<$Res>
    implements $ListTooLongCopyWith<$Res> {
  _$ListTooLongCopyWithImpl(
      ListTooLong _value, $Res Function(ListTooLong) _then)
      : super(_value, (v) => _then(v as ListTooLong));

  @override
  ListTooLong get _value => super._value as ListTooLong;

  @override
  $Res call({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _then(ListTooLong(
      failedValue == freezed ? _value.failedValue : failedValue as dynamic,
      max == freezed ? _value.max : max as int,
    ));
  }
}

class _$ListTooLong implements ListTooLong {
  const _$ListTooLong(this.failedValue, this.max)
      : assert(failedValue != null),
        assert(max != null);

  @override
  final dynamic failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'ValueFailure.listTooLong(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ListTooLong &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(max);

  @override
  $ListTooLongCopyWith<ListTooLong> get copyWith =>
      _$ListTooLongCopyWithImpl<ListTooLong>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(dynamic failedValue, int max),
    @required Result empty(dynamic failedValue),
    @required Result multiline(dynamic failedValue),
    @required Result listTooLong(dynamic failedValue, int max),
    @required Result invalidEmail(dynamic failedValue),
    @required Result shortPassword(dynamic failedValue),
    @required Result numberNotPositive(dynamic failedValue),
    @required Result nullValue(),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return listTooLong(failedValue, max);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(dynamic failedValue, int max),
    Result empty(dynamic failedValue),
    Result multiline(dynamic failedValue),
    Result listTooLong(dynamic failedValue, int max),
    Result invalidEmail(dynamic failedValue),
    Result shortPassword(dynamic failedValue),
    Result numberNotPositive(dynamic failedValue),
    Result nullValue(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (listTooLong != null) {
      return listTooLong(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength value),
    @required Result empty(Empty value),
    @required Result multiline(Multiline value),
    @required Result listTooLong(ListTooLong value),
    @required Result invalidEmail(InvalidEmail value),
    @required Result shortPassword(ShortPassword value),
    @required Result numberNotPositive(NumberNotPositive value),
    @required Result nullValue(NullValue value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return listTooLong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength value),
    Result empty(Empty value),
    Result multiline(Multiline value),
    Result listTooLong(ListTooLong value),
    Result invalidEmail(InvalidEmail value),
    Result shortPassword(ShortPassword value),
    Result numberNotPositive(NumberNotPositive value),
    Result nullValue(NullValue value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (listTooLong != null) {
      return listTooLong(this);
    }
    return orElse();
  }
}

abstract class ListTooLong implements ValueFailure {
  const factory ListTooLong(dynamic failedValue, int max) = _$ListTooLong;

  dynamic get failedValue;
  int get max;
  $ListTooLongCopyWith<ListTooLong> get copyWith;
}

abstract class $InvalidEmailCopyWith<$Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail value, $Res Function(InvalidEmail) then) =
      _$InvalidEmailCopyWithImpl<$Res>;
  $Res call({dynamic failedValue});
}

class _$InvalidEmailCopyWithImpl<$Res> extends _$ValueFailureCopyWithImpl<$Res>
    implements $InvalidEmailCopyWith<$Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail _value, $Res Function(InvalidEmail) _then)
      : super(_value, (v) => _then(v as InvalidEmail));

  @override
  InvalidEmail get _value => super._value as InvalidEmail;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidEmail(
      failedValue == freezed ? _value.failedValue : failedValue as dynamic,
    ));
  }
}

class _$InvalidEmail implements InvalidEmail {
  const _$InvalidEmail(this.failedValue) : assert(failedValue != null);

  @override
  final dynamic failedValue;

  @override
  String toString() {
    return 'ValueFailure.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmail &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidEmailCopyWith<InvalidEmail> get copyWith =>
      _$InvalidEmailCopyWithImpl<InvalidEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(dynamic failedValue, int max),
    @required Result empty(dynamic failedValue),
    @required Result multiline(dynamic failedValue),
    @required Result listTooLong(dynamic failedValue, int max),
    @required Result invalidEmail(dynamic failedValue),
    @required Result shortPassword(dynamic failedValue),
    @required Result numberNotPositive(dynamic failedValue),
    @required Result nullValue(),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(dynamic failedValue, int max),
    Result empty(dynamic failedValue),
    Result multiline(dynamic failedValue),
    Result listTooLong(dynamic failedValue, int max),
    Result invalidEmail(dynamic failedValue),
    Result shortPassword(dynamic failedValue),
    Result numberNotPositive(dynamic failedValue),
    Result nullValue(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength value),
    @required Result empty(Empty value),
    @required Result multiline(Multiline value),
    @required Result listTooLong(ListTooLong value),
    @required Result invalidEmail(InvalidEmail value),
    @required Result shortPassword(ShortPassword value),
    @required Result numberNotPositive(NumberNotPositive value),
    @required Result nullValue(NullValue value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength value),
    Result empty(Empty value),
    Result multiline(Multiline value),
    Result listTooLong(ListTooLong value),
    Result invalidEmail(InvalidEmail value),
    Result shortPassword(ShortPassword value),
    Result numberNotPositive(NumberNotPositive value),
    Result nullValue(NullValue value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail implements ValueFailure {
  const factory InvalidEmail(dynamic failedValue) = _$InvalidEmail;

  dynamic get failedValue;
  $InvalidEmailCopyWith<InvalidEmail> get copyWith;
}

abstract class $ShortPasswordCopyWith<$Res> {
  factory $ShortPasswordCopyWith(
          ShortPassword value, $Res Function(ShortPassword) then) =
      _$ShortPasswordCopyWithImpl<$Res>;
  $Res call({dynamic failedValue});
}

class _$ShortPasswordCopyWithImpl<$Res> extends _$ValueFailureCopyWithImpl<$Res>
    implements $ShortPasswordCopyWith<$Res> {
  _$ShortPasswordCopyWithImpl(
      ShortPassword _value, $Res Function(ShortPassword) _then)
      : super(_value, (v) => _then(v as ShortPassword));

  @override
  ShortPassword get _value => super._value as ShortPassword;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(ShortPassword(
      failedValue == freezed ? _value.failedValue : failedValue as dynamic,
    ));
  }
}

class _$ShortPassword implements ShortPassword {
  const _$ShortPassword(this.failedValue) : assert(failedValue != null);

  @override
  final dynamic failedValue;

  @override
  String toString() {
    return 'ValueFailure.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ShortPassword &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $ShortPasswordCopyWith<ShortPassword> get copyWith =>
      _$ShortPasswordCopyWithImpl<ShortPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(dynamic failedValue, int max),
    @required Result empty(dynamic failedValue),
    @required Result multiline(dynamic failedValue),
    @required Result listTooLong(dynamic failedValue, int max),
    @required Result invalidEmail(dynamic failedValue),
    @required Result shortPassword(dynamic failedValue),
    @required Result numberNotPositive(dynamic failedValue),
    @required Result nullValue(),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(dynamic failedValue, int max),
    Result empty(dynamic failedValue),
    Result multiline(dynamic failedValue),
    Result listTooLong(dynamic failedValue, int max),
    Result invalidEmail(dynamic failedValue),
    Result shortPassword(dynamic failedValue),
    Result numberNotPositive(dynamic failedValue),
    Result nullValue(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength value),
    @required Result empty(Empty value),
    @required Result multiline(Multiline value),
    @required Result listTooLong(ListTooLong value),
    @required Result invalidEmail(InvalidEmail value),
    @required Result shortPassword(ShortPassword value),
    @required Result numberNotPositive(NumberNotPositive value),
    @required Result nullValue(NullValue value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength value),
    Result empty(Empty value),
    Result multiline(Multiline value),
    Result listTooLong(ListTooLong value),
    Result invalidEmail(InvalidEmail value),
    Result shortPassword(ShortPassword value),
    Result numberNotPositive(NumberNotPositive value),
    Result nullValue(NullValue value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword implements ValueFailure {
  const factory ShortPassword(dynamic failedValue) = _$ShortPassword;

  dynamic get failedValue;
  $ShortPasswordCopyWith<ShortPassword> get copyWith;
}

abstract class $NumberNotPositiveCopyWith<$Res> {
  factory $NumberNotPositiveCopyWith(
          NumberNotPositive value, $Res Function(NumberNotPositive) then) =
      _$NumberNotPositiveCopyWithImpl<$Res>;
  $Res call({dynamic failedValue});
}

class _$NumberNotPositiveCopyWithImpl<$Res>
    extends _$ValueFailureCopyWithImpl<$Res>
    implements $NumberNotPositiveCopyWith<$Res> {
  _$NumberNotPositiveCopyWithImpl(
      NumberNotPositive _value, $Res Function(NumberNotPositive) _then)
      : super(_value, (v) => _then(v as NumberNotPositive));

  @override
  NumberNotPositive get _value => super._value as NumberNotPositive;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(NumberNotPositive(
      failedValue == freezed ? _value.failedValue : failedValue as dynamic,
    ));
  }
}

class _$NumberNotPositive implements NumberNotPositive {
  const _$NumberNotPositive(this.failedValue) : assert(failedValue != null);

  @override
  final dynamic failedValue;

  @override
  String toString() {
    return 'ValueFailure.numberNotPositive(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NumberNotPositive &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $NumberNotPositiveCopyWith<NumberNotPositive> get copyWith =>
      _$NumberNotPositiveCopyWithImpl<NumberNotPositive>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(dynamic failedValue, int max),
    @required Result empty(dynamic failedValue),
    @required Result multiline(dynamic failedValue),
    @required Result listTooLong(dynamic failedValue, int max),
    @required Result invalidEmail(dynamic failedValue),
    @required Result shortPassword(dynamic failedValue),
    @required Result numberNotPositive(dynamic failedValue),
    @required Result nullValue(),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return numberNotPositive(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(dynamic failedValue, int max),
    Result empty(dynamic failedValue),
    Result multiline(dynamic failedValue),
    Result listTooLong(dynamic failedValue, int max),
    Result invalidEmail(dynamic failedValue),
    Result shortPassword(dynamic failedValue),
    Result numberNotPositive(dynamic failedValue),
    Result nullValue(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (numberNotPositive != null) {
      return numberNotPositive(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength value),
    @required Result empty(Empty value),
    @required Result multiline(Multiline value),
    @required Result listTooLong(ListTooLong value),
    @required Result invalidEmail(InvalidEmail value),
    @required Result shortPassword(ShortPassword value),
    @required Result numberNotPositive(NumberNotPositive value),
    @required Result nullValue(NullValue value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return numberNotPositive(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength value),
    Result empty(Empty value),
    Result multiline(Multiline value),
    Result listTooLong(ListTooLong value),
    Result invalidEmail(InvalidEmail value),
    Result shortPassword(ShortPassword value),
    Result numberNotPositive(NumberNotPositive value),
    Result nullValue(NullValue value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (numberNotPositive != null) {
      return numberNotPositive(this);
    }
    return orElse();
  }
}

abstract class NumberNotPositive implements ValueFailure {
  const factory NumberNotPositive(dynamic failedValue) = _$NumberNotPositive;

  dynamic get failedValue;
  $NumberNotPositiveCopyWith<NumberNotPositive> get copyWith;
}

abstract class $NullValueCopyWith<$Res> {
  factory $NullValueCopyWith(NullValue value, $Res Function(NullValue) then) =
      _$NullValueCopyWithImpl<$Res>;
}

class _$NullValueCopyWithImpl<$Res> extends _$ValueFailureCopyWithImpl<$Res>
    implements $NullValueCopyWith<$Res> {
  _$NullValueCopyWithImpl(NullValue _value, $Res Function(NullValue) _then)
      : super(_value, (v) => _then(v as NullValue));

  @override
  NullValue get _value => super._value as NullValue;
}

class _$NullValue implements NullValue {
  const _$NullValue();

  @override
  String toString() {
    return 'ValueFailure.nullValue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NullValue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result exceedingLength(dynamic failedValue, int max),
    @required Result empty(dynamic failedValue),
    @required Result multiline(dynamic failedValue),
    @required Result listTooLong(dynamic failedValue, int max),
    @required Result invalidEmail(dynamic failedValue),
    @required Result shortPassword(dynamic failedValue),
    @required Result numberNotPositive(dynamic failedValue),
    @required Result nullValue(),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return nullValue();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result exceedingLength(dynamic failedValue, int max),
    Result empty(dynamic failedValue),
    Result multiline(dynamic failedValue),
    Result listTooLong(dynamic failedValue, int max),
    Result invalidEmail(dynamic failedValue),
    Result shortPassword(dynamic failedValue),
    Result numberNotPositive(dynamic failedValue),
    Result nullValue(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nullValue != null) {
      return nullValue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result exceedingLength(ExceedingLength value),
    @required Result empty(Empty value),
    @required Result multiline(Multiline value),
    @required Result listTooLong(ListTooLong value),
    @required Result invalidEmail(InvalidEmail value),
    @required Result shortPassword(ShortPassword value),
    @required Result numberNotPositive(NumberNotPositive value),
    @required Result nullValue(NullValue value),
  }) {
    assert(exceedingLength != null);
    assert(empty != null);
    assert(multiline != null);
    assert(listTooLong != null);
    assert(invalidEmail != null);
    assert(shortPassword != null);
    assert(numberNotPositive != null);
    assert(nullValue != null);
    return nullValue(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result exceedingLength(ExceedingLength value),
    Result empty(Empty value),
    Result multiline(Multiline value),
    Result listTooLong(ListTooLong value),
    Result invalidEmail(InvalidEmail value),
    Result shortPassword(ShortPassword value),
    Result numberNotPositive(NumberNotPositive value),
    Result nullValue(NullValue value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nullValue != null) {
      return nullValue(this);
    }
    return orElse();
  }
}

abstract class NullValue implements ValueFailure {
  const factory NullValue() = _$NullValue;
}
