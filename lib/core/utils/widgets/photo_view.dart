import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewWidget extends StatelessWidget {
  final String imagePath;
  final bool isNetworkImage;

  const PhotoViewWidget({
    super.key,
    required this.imagePath,
    required this.isNetworkImage,
  });

  @override
  Widget build(BuildContext context) {
    if (isNetworkImage) {
      return PhotoView(
        imageProvider: NetworkImage(imagePath),
      );
    } else {
      return PhotoView(
        imageProvider: FileImage(File(imagePath), scale: 0.7),
      );
    }
  }
}
