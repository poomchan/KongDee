// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'image_failure.dart';

abstract class IImageRepository {
  Future<Option<File>> getImage();
  Future<Option<File>> takePicture();
  Future<File> compressImage(File image, {int quality = 10});
  Future<Either<ImageFailure, String>> uploadFileImage(File img, String path);
}
