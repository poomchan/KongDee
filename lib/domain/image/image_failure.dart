import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_failure.freezed.dart';

@immutable
@freezed
abstract class ImageFailure with _$ImageFailure{
  const factory ImageFailure.serverError() = _ServerError;
  const factory ImageFailure.unexpected(dynamic err) = _Unexpected;
}