import 'package:flutter/material.dart';
import 'package:fluttertaladsod/services/image_service.dart';

class PickImageDialog extends StatelessWidget {
  final Function onGetImage;

  PickImageDialog({this.onGetImage});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Update Profile Image'),
      children: <Widget>[
        SimpleDialogOption(
          child: Text('Photo with camara'),
          onPressed: () =>
              imageService.handleTakePhoto(context, onGetImage: onGetImage),
        ),
        SimpleDialogOption(
          child: Text('Image from gallery'),
          onPressed: () => imageService.handleChooseFromGallery(context,
              onGetImage: onGetImage),
        ),
        SimpleDialogOption(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
