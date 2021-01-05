import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_failure.freezed.dart';

@immutable
@freezed
abstract class InfoFailure with _$InfoFailure{
  const factory InfoFailure.noInfo() = NoInfo;
  const factory InfoFailure.serverFailure() = ServerFailure;
  const factory InfoFailure.unexpected(dynamic err) = Unexpected;
}