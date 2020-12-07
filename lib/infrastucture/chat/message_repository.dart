import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:fluttertaladsod/infrastucture/chat/message_dto.dart';
import 'package:fluttertaladsod/infrastucture/core/firestore_helper.dart';
import 'package:get/get.dart';

class MessageRepository implements IMessageRepository {
  static const String collection = 'chats';
  static const String timestamp = 'timestamp';
  final _firestore = Get.find<FirebaseFirestore>();
  DocumentSnapshot lastDoc;

  @override
  Stream<Either<MessageFailure, List<MessageDomain>>> watchMessages({
    @required UniqueId storeId,
    @required UniqueId viewerId,
  }) async* {
    final _ref = _firestore.storeCollectionRef
        .doc(storeId.getOrCrash())
        .collection(collection);

    final snap = await _ref
        .orderBy(timestamp, descending: true)
        .limit(IMessageRepository.itemPerPage)
        .get();

    if (snap.docs.isEmpty) {
      // no prevoius messages, wait and watch for the first message
      yield* _ref.orderBy(timestamp).snapshots().map(
        (snap) {
          if (snap.docs.isEmpty) {
            return left(MessageFailure.emptyChatRoom());
          }
          final chatList = _mapToDomain(snap.docs, viewerId);
          return right(chatList);
        },
      );
    } else {
      // watch messages by having a starting doc, no way it is empty
      lastDoc = snap.docs.last;
      yield* _ref.orderBy(timestamp).startAtDocument(lastDoc).snapshots().map(
        (snap) {
          final chatList = _mapToDomain(snap.docs, viewerId);
          return right(chatList);
        },
      );
    }
  }

  @override
  Future<Either<MessageFailure, List<MessageDomain>>> fetchMoreMessages({
    @required UniqueId storeId,
    @required UniqueId viewerId,
  }) async {
    if (lastDoc == null) return left(MessageFailure.emptyChatRoom());
    try {
      final _ref = _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection);
      final snap = await _ref
          .orderBy(timestamp, descending: true)
          .startAfterDocument(lastDoc)
          .limit(IMessageRepository.itemPerPage)
          .get();
      lastDoc = snap.docs.last;
      if (snap.docs.isEmpty) {
        return left(MessageFailure.emptyChatRoom());
      } else {
        final chatList = _mapToDomain(snap.docs, viewerId);
        return right(chatList);
      }
    } catch (e) {
      return left(MessageFailure.severFailure());
    }
  }

  @override
  Future<Either<MessageFailure, Unit>> uploadMessage({
    UniqueId storeId,
    MessageDomain chat,
  }) async {
    try {
      final jsonData = MessageDto.fromDomain(chat).toJson();
      await _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection)
          .doc(chat.id.getOrCrash())
          .set(jsonData);
      return right(unit);
    } catch (e) {
      return left(MessageFailure.severFailure());
    }
  }

  @override
  Future<Either<MessageFailure, Unit>> deleteMessage(
      {UniqueId storeId, UniqueId chatId}) async {
    try {
      final chatDoc = await _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection)
          .doc(chatId.getOrCrash())
          .get();
      if (!chatDoc.exists) {
        return left(MessageFailure.noSuchMessage());
      }
      await _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection)
          .doc(chatId.getOrCrash())
          .delete();
      return right(unit);
    } catch (e) {
      return left(MessageFailure.severFailure());
    }
  }

  List<MessageDomain> _mapToDomain(
    List<DocumentSnapshot> docList,
    UniqueId viewerId,
  ) {
    final List<MessageDomain> chatList = [];
    for (final doc in docList) {
      final chat = MessageDto.fromFirestore(doc).toDomain(viewerId: viewerId);
      chatList.add(chat);
    }
    return chatList;
  }

  @override
  void clearState() {
    lastDoc = null;
  }
}
