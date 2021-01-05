import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/info/info.dart';

import 'info_failure.dart';

abstract class IInfoRepoSitory {
  Stream<Either<InfoFailure, List<InfoDomain>>> watchInfo();
}