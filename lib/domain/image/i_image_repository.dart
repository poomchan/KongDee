import 'dart:io';
import 'package:dartz/dartz.dart';
import 'image_failure.dart';

abstract class IImageRepository {
  Future<Option<File>> getImage();
  Future<Option<File>> takePicture();
  Future<File> compressImage(File image, {int quality = 100});
  Future<Either<ImageFailure, String>> uploadFileImage(File img, String path);
}
