import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:fluttertaladsod/domain/core/value_objects.dart';
import 'package:fluttertaladsod/domain/image/i_image_repository.dart';
import 'package:fluttertaladsod/domain/image/image_failure.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as im;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class ImageRepository implements IImageRepository {
  final _imagePicker = Get.find<ImagePicker>();
  final _storage = Get.find<StorageReference>();

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

  @override
  Future<File> compressImage(File image, {int quality = 100}) async {
    final String imageId = Uuid().v4();
    final tempDIr = await getTemporaryDirectory();
    final path = tempDIr.path;

    final im.Image imageFile = im.decodeImage(image.readAsBytesSync());
    final compressedImageFile = File('$path/img_$imageId.jpg')
      ..writeAsBytesSync(im.encodeJpg(imageFile, quality: 10));
    return compressedImageFile;
  }

  @override
  Future<Either<ImageFailure, String>> uploadFileImage(
      File img, String path) async {
    try {
      final imageId = UniqueId().getOrCrash();
      // upload (path in firebase storage)
      final StorageUploadTask uploadTask =
          _storage.child("$path/img_$imageId").putFile(img);

      // wait for completion
      final StorageTaskSnapshot storageSnap = await uploadTask.onComplete;

      //get download Url
      final String mediaUrl = await storageSnap.ref.getDownloadURL() as String;
      return right(mediaUrl);
    } catch (err) {
      return left(ImageFailure.unexpected(err));
    }
  }
}
