import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/info/i_info_repository.dart';
import 'package:fluttertaladsod/domain/info/info.dart';
import 'package:fluttertaladsod/domain/info/info_failure.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import 'info_dto.dart';

class InfoRepository extends IInfoRepoSitory {
  final FirebaseFirestore _firestore = Get.find();
  @override
  Stream<Either<InfoFailure, List<InfoDomain>>> watchInfo() async* {
    try {
      yield* _firestore.collection('info').snapshots().map((querySnapshot) {
        if (querySnapshot.docs.isEmpty) {
          return left<InfoFailure, List<InfoDomain>>(InfoFailure.noInfo());
        }
        return right<InfoFailure, List<InfoDomain>>(
          querySnapshot.docs
              .map((snap) => InfoDto.fromFirestore(snap).toDomain())
              .toList(),
        );
      }).onErrorReturnWith((err) {
        // log error onto the console here
        return left(InfoFailure.unexpected(err));
      });
    } catch (err) {
      yield left(InfoFailure.unexpected(err));
    }
  }
}
