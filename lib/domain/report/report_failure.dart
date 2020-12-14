import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_failure.freezed.dart';

@immutable
@freezed
abstract class ReportFailure with _$ReportFailure{
  const factory ReportFailure.unexpected(err) = _Unexpected;
  const factory ReportFailure.serverError() = _ServerError;
}