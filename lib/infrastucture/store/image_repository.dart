import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:fluttertaladsod/domain/store/i_image_repository.dart';
import 'package:image/image.dart' as im;
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

@prod
@LazySingleton(as: IImageRepository)
class ImageRepository implements IImageRepository {
  final ImagePicker _imagePicker;

  ImageRepository(
    this._imagePicker,
  );

  @override
  Future<Option<File>> getImage() async {
    try {
      final PickedFile result =
          await _imagePicker.getImage(source: ImageSource.gallery);
      if (result != null) {
        return some(File(result.path));
      }
    } on PlatformException {
      openAppSettings();
    }
    // cancle by user
    return none();
  }

  @override
  Future<Option<File>> takePicture() async {
    try {
      final PickedFile result =
          await _imagePicker.getImage(source: ImageSource.camera);
      if (result != null) {
        return some(File(result.path));
      }
    } on PlatformException {
      openAppSettings();
    }
    // cancle by user
    return none();
  }

  Future<File> compressImage(File image) async {
    final String imageId = Uuid().v4();
    final tempDIr = await getTemporaryDirectory();
    final path = tempDIr.path;

    final im.Image imageFile = im.decodeImage(image.readAsBytesSync());
    final compressedImageFile = File('$path/img_$imageId.jpg')
      ..writeAsBytesSync(im.encodeJpg(imageFile, quality: 35));
    return compressedImageFile;
  }
}
