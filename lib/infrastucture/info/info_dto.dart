import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/info/info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_dto.freezed.dart';
part 'info_dto.g.dart';

@immutable
@freezed
abstract class InfoDto implements _$InfoDto {
  const factory InfoDto({
    String id,
    @required String body,
    @required String title,
  }) = _InfoDto;

  InfoDomain toDomain() {
    return InfoDomain(
      id: UniqueId.fromUniqueString(id),
      body: body,
      title: title,
    );
  }

  factory InfoDto.fromJson(Map<String, dynamic> json) =>
      _$InfoDtoFromJson(json);

  factory InfoDto.fromFirestore(DocumentSnapshot snap) =>
      InfoDto.fromJson(snap.data()).copyWith(id: snap.id);

  const InfoDto._();
}
