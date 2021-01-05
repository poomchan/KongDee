import 'package:flutter/material.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'info.freezed.dart';

@immutable
@freezed
abstract class InfoDomain implements _$InfoDomain {
  const factory InfoDomain({
    @required UniqueId id,
    @required String title,
    @required String body,
  }) = _InfoDomain;

  const InfoDomain._();
}
