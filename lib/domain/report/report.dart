import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@immutable
@freezed
abstract class Report implements _$Report {
  const factory Report.user({
    @required String id,
    @required String userId,
    @required String reporter,
    @required String description,
    @required bool recieve,
  }) = _User;
  const factory Report.store({
    @required String id,
    @required String storeId,
    @required String reporter,
    @required String description,
    @required bool recieve,
  }) = _Store;


  factory Report.fromFirestore(DocumentSnapshot doc) =>
      Report.fromJson(doc.data());

  factory Report.fromJson(Map<String, dynamic> json) =>
      _$ReportFromJson(json);

  const Report._();

}
