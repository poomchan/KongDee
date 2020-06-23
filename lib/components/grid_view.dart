import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

Widget buildGridView(List<Asset> imageList) {
  return GridView.count(
    crossAxisCount: 3,
    children: List.generate(imageList.length, (index) {
      Asset asset = imageList[index];
      return Padding(
        padding: EdgeInsets.all(1.0),
        child: AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        ),
      );
    }),
  );
}
