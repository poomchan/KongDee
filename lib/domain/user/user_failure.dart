import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_failure.freezed.dart';

@immutable
@freezed
abstract class UserFailure with _$UserFailure{
  const factory UserFailure.noSuchUser() = _NoSuchUser;
  const factory UserFailure.serveFailure() = _ServerFailure;
  const factory UserFailure.unexpected(f) = _Unexpected;

}