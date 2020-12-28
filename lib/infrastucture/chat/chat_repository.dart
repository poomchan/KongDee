import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/chat/chat.dart';
import 'package:fluttertaladsod/domain/chat/chat_failure.dart';
import 'package:fluttertaladsod/domain/chat/i_chat_repository.dart';
import 'package:fluttertaladsod/domain/chat/message.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/infrastucture/chat/message_dto.dart';
import 'package:fluttertaladsod/infrastucture/core/firestore_helper.dart';
import 'package:get/get.dart';

@immutable
class ChatRepository implements IChatRepository {
  static const String collection = 'chats';
  static const String timestamp = 'timestamp';
  final _firestore = Get.find<FirebaseFirestore>();
  // DocumentSnapshot lastDoc;

  @override
  Stream<Either<ChatFailure, List<MessageDomain>>> watchStoreMessages({
    @required UniqueId storeId,
    @required UniqueId viewerId,
    @required int amount,
  }) async* {
    try {
      final _ref = _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection);

      final snap =
          await _ref.orderBy(timestamp, descending: true).limit(amount).get();

      if (snap.docs.isEmpty) {
        // no prevoius messages, wait and watch for the first message
        yield* _ref.orderBy(timestamp).snapshots().map(
          (snap) {
            if (snap.docs.isEmpty) {
              return left(ChatFailure.emptyChatRoom());
            }
            final messageList = _mapDocListToMessageList(snap.docs, viewerId);
            return right(messageList);
          },
        );
      } else {
        // watch messages by having a starting doc, no way it is empty
        yield* _ref
            .orderBy(timestamp)
            .startAtDocument(snap.docs.last)
            .snapshots()
            .map(
          (snap) {
            final messageList = _mapDocListToMessageList(snap.docs, viewerId);
            return right(messageList);
          },
        );
      }
    } catch (err) {
      yield left(ChatFailure.unexpected(err));
    }
  }

  @override
  Future<Either<ChatFailure, List<MessageDomain>>> fetchMoreStoreMessages({
    @required UniqueId storeId,
    @required UniqueId viewerId,
    @required MessageDomain lastMessage,
  }) async {
    try {
      final _ref = _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection);
      final snap = await _ref
          .orderBy(timestamp, descending: true)
          .startAfter([lastMessage.id.getOrCrash()])
          .limit(Chat.itemPerPage)
          .get();
      if (snap.docs.isEmpty) {
        return left(ChatFailure.emptyChatRoom());
      } else {
        final chatList = _mapDocListToMessageList(snap.docs, viewerId);
        return right(chatList);
      }
    } catch (e) {
      return left(ChatFailure.unexpected(e));
    }
  }

  @override
  Future<Either<ChatFailure, Unit>> uploadStoreMessage({
    @required UniqueId storeId,
    @required MessageDomain message,
  }) async {
    try {
      final jsonData = MessageDto.fromDomain(message).toJson();
      await _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection)
          .doc(message.id.getOrCrash())
          .set(jsonData);
      return right(unit);
    } catch (e) {
      return left(ChatFailure.unexpected(e));
    }
  }

  @override
  Future<Either<ChatFailure, Unit>> deleteStoreMessage({
    UniqueId storeId,
    UniqueId messageId,
  }) async {
    try {
      final chatDoc = await _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection)
          .doc(messageId.getOrCrash())
          .get();
      if (!chatDoc.exists) {
        return left(ChatFailure.noSuchMessage());
      }
      await _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection)
          .doc(messageId.getOrCrash())
          .delete();
      return right(unit);
    } catch (err) {
      return left(ChatFailure.unexpected(err));
    }
  }

  List<MessageDomain> _mapDocListToMessageList(
    List<DocumentSnapshot> docList,
    UniqueId viewerId,
  ) =>
      docList
          .map((doc) =>
              MessageDto.fromFirestore(doc).toDomain(viewerId: viewerId))
          .toList();
}
