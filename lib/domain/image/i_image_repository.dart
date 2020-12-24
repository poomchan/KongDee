import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fluttertaladsod/domain/image/image_failure.dart';

abstract class IImageRepository {
  Future<Option<File>> getImage();
  Future<Option<File>> takePicture();
  Future<File> compressImage(File image);

  Future<Either<ImageFailure, String>> uploadFileImage(File img, String path);
}
