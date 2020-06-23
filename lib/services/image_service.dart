import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Im;
import 'package:uuid/uuid.dart';

class ImageService {
  handleTakePhoto(
    BuildContext context, {
    @required Function onGetImage,
    bool popPage = true,
  }) async {
    if (popPage) {
      Navigator.pop(context);
    }

    // remove the dialog
    Navigator.pop(context);

    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxWidth: 900, maxHeight: 900);
    if (image != null) {
      onGetImage(image);
    }
  }

  handleChooseFromGallery(
    BuildContext context, {
    @required Function onGetImage,
    bool popPage = true,
  }) async {
    // remove the dialog
    if (popPage) {
      Navigator.pop(context);
    }

    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      onGetImage(image);
    }
  }

  compressImage(BuildContext context, File image) async {
    String imageId = Uuid().v4();

//    final userId = Provider.of<Data>(context, listen: false).currentUser.id;
    final tempDIr = await getTemporaryDirectory();
    final path = tempDIr.path;

    Im.Image imageFile = Im.decodeImage(image.readAsBytesSync());
    final compressedImageFile = File('$path/img_$imageId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile, quality: 35));
    return compressedImageFile;
  }

  getMultiImages({@required Function onGetImages}) async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "take photo"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (err) {
      print(err.toString());
    }

    onGetImages(resultList);
  }
}

ImageService imageService = ImageService();
