// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:fluttertaladsod/domain/report/report.dart';
import 'package:fluttertaladsod/domain/report/report_failure.dart';

abstract class IReportRepository {
  Future<Either<ReportFailure, Unit>> sendReport(Report r);
}
