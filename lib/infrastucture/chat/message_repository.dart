import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/message/i_message_repository.dart';
import 'package:fluttertaladsod/domain/message/message.dart';
import 'package:fluttertaladsod/domain/message/message_failure.dart';
import 'package:fluttertaladsod/infrastucture/chat/message_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:fluttertaladsod/infrastucture/core/firestore_helper.dart';

@LazySingleton(as: IMessageRepository)
class MessageRepository implements IMessageRepository {
  final FirebaseFirestore _firestore;
  DocumentSnapshot start;
  DocumentSnapshot end;
  static const String collection = 'chats';
  static const String timestamp = 'timestamp';

  MessageRepository(this._firestore);

  List<MessageDomain> _transformToDomain(List<DocumentSnapshot> docList) {
    final List<MessageDomain> chatList = [];
    for (final doc in docList) {
      final chat = MessageDto.fromFirestore(doc).toDomain();
      chatList.add(chat);
    }
    return chatList;
  }

  @override
  Stream<Either<MessageFailure, List<MessageDomain>>> watchMessages(
      {UniqueId storeId}) async* {
    const int firstDocs = 20;
    final _ref = _firestore.storeCollectionRef
        .doc(storeId.getOrCrash())
        .collection(collection);

    final snap = await _ref
        .orderBy(timestamp, descending: true)
        .limit(firstDocs)
        .get();

    if (snap.docs.isEmpty) {
      // watch the first message
      yield* _ref
          .orderBy(timestamp)
          .snapshots(includeMetadataChanges: true)
          .map((snap) {
        if (snap.docs.isEmpty) {
          return left(MessageFailure.emtyChat());
        }
        final chatList = _transformToDomain(snap.docs);
        return right(chatList);
      });
    } else {
      // watch messages by having a starting doc
      start = snap.docs.last;
      yield* _ref
          .orderBy(timestamp)
          .startAtDocument(start)
          .snapshots()
          .map((snap) {
        if (snap.docs.isEmpty) {
          return left(MessageFailure.emtyChat());
        }
        final chatList = _transformToDomain(snap.docs);
        return right(chatList);
      });
    }
  }

  @override
  Stream<Either<MessageFailure, List<MessageDomain>>> watchMoreMessages(
      {UniqueId storeId}) async* {
    const int moreDocs = 20;
    final _ref = _firestore.storeCollectionRef
        .doc(storeId.getOrCrash())
        .collection(collection);

    final snap = await _ref
        .orderBy(timestamp, descending: true)
        .startAtDocument(start)
        .limit(moreDocs)
        .get();

    if (snap.docs.isEmpty) {
      yield left(MessageFailure.emtyChat());
    } else {
      end = start;
      start = snap.docs.last;
      yield* _ref
          .orderBy(timestamp)
          .startAtDocument(start)
          .endBeforeDocument(end)
          .snapshots()
          .map((snap) {
        if (snap.docs.isEmpty) {
          return left(MessageFailure.emtyChat());
        }
        final chatList = _transformToDomain(snap.docs);
        return right(chatList);
      });
    }
  }

  @override
  Future<Either<MessageFailure, Unit>> uploadMessage({
    UniqueId storeId,
    MessageDomain chat,
  }) async {
    final user = await _firestore.userDomain();

    final jsonData = MessageDto.fromDomain(chat).toJson()
      ..addEntries([
        MapEntry('senderId', user.id.getOrCrash()),
        MapEntry('senderName', user.displayName),
        MapEntry('senderAvatarUrl', user.photoURL),
      ]);

    try {
      await _firestore.storeCollectionRef
          .doc(storeId.getOrCrash())
          .collection(collection)
          .doc(chat.id.getOrCrash())
          .set(jsonData);
      return right(unit);
    } on PlatformException {
      return left(MessageFailure.severFailure());
    }
  }

  @override
  Future<Either<MessageFailure, Unit>> deleteMessage(
      {UniqueId storeId, UniqueId chatId}) async {
    final chatDoc = await _firestore.storeCollectionRef
        .doc(storeId.getOrCrash())
        .collection(collection)
        .doc(chatId.getOrCrash())
        .get();
    if (!chatDoc.exists) {
      return left(MessageFailure.emtyChat());
    }
    await _firestore.storeCollectionRef
        .doc(storeId.getOrCrash())
        .collection(collection)
        .doc(chatId.getOrCrash())
        .delete();
    return right(unit);
  }
}
