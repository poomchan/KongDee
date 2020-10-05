import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class IImageRepository {
  Future<Option<File>> getImage();
  Future<Option<File>> takePicture();
  Future<File> compressImage(File image);
}
