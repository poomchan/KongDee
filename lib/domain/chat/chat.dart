import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertaladsod/domain/chat/message.dart';
import 'package:fluttertaladsod/domain/core/entity.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';

@immutable
@freezed
abstract class Chat with _$Chat{
  @Implements(IEntity)
  const factory Chat({
    @required UniqueId id,
    @required List<MessageDomain> messages,
    @required DocumentSnapshot lastDoc,
  }) = _Chat;
  static const int itemPerPage = 20;
}