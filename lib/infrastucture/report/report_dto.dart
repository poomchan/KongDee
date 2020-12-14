import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/report/report.dart';
import 'package:fluttertaladsod/infrastucture/core/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_dto.freezed.dart';
part 'report_dto.g.dart';

@immutable
@freezed
abstract class ReportDto implements _$ReportDto {
  const factory ReportDto.user({
    @required String type,
    @required String userId,
    @required String reporter,
    @required String description,
    @required bool received,
    @required @TimestampConverter() Timestamp timestamp,
  }) = _UserReportDto;

  const factory ReportDto.store({
    @required String type,
    @required String storeId,
    @required String reporter,
    @required String description,
    @required bool received,
    @required @TimestampConverter() Timestamp timestamp,
  }) = _StoreReportDto;

  factory ReportDto.fromDomain(Report r) {
    return r.map(
      user: (u) => ReportDto.user(
        type: 'USER',
        userId: u.userId.getOrCrash(),
        reporter: u.reporter.getOrCrash(),
        description: u.description,
        received: false,
        timestamp: Timestamp.now(),
      ),
      store: (s) => ReportDto.store(
        type: 'STORE',
        storeId: s.storesId.getOrCrash(),
        reporter: s.reporter.getOrCrash(),
        description: s.description,
        received: false,
        timestamp: Timestamp.now(),
      ),
    );
  }

  Report toDomain() => map(
        user: (u) => Report.user(
          userId: UniqueId.fromUniqueString(u.userId),
          reporter: UniqueId.fromUniqueString(u.reporter),
          description: u.description,
        ),
        store: (s) => Report.store(
          storesId: UniqueId.fromUniqueString(s.storeId),
          reporter: UniqueId.fromUniqueString(s.reporter),
          description: s.description,
        ),
      );

  factory ReportDto.fromFirestore(DocumentSnapshot doc) =>
      ReportDto.fromJson(doc.data());

  factory ReportDto.fromJson(Map<String, dynamic> json) =>
      _$ReportDtoFromJson(json);

  const ReportDto._();
}
