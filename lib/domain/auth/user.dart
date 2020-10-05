import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class UserDomain with _$UserDomain {
  const factory UserDomain({
    @required UniqueId id,
    @required String displayName,
    @required String email,
    @required String photoURL,
  }) = _User;
}
