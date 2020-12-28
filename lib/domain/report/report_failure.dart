import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_failure.freezed.dart';

@immutable
@freezed
abstract class ReportFailure with _$ReportFailure{
  const factory ReportFailure.serverError() = _ServerError;
  const factory ReportFailure.timeout() = _Timeout;
  const factory ReportFailure.unexpected(dynamic err) = _Unexpected;
}