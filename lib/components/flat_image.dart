import 'package:flutter/material.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A photo class that is custom image representation When any of the width or height param is 0,
/// no size will be passed and image will be rendered as it is by its own size.
class FlatImage extends StatelessWidget {
  final String name;
  final double width;
  final double height;

  const FlatImage(
      {Key? key, required this.name, this.width = 0, this.height = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fileName = "assets/images/$name";
    if (width == 0 || height == 0) {
      return Image.asset(fileName);
    } else {
      double scaleFactor = ScreenSize.isTablet() ? tabletScaleFactor : 1.0;
      double scaledWidth = width * scaleFactor;
      double scaledHeight = height * scaleFactor;
      return Image.asset(
        fileName,
        width: scaledWidth,
        height: scaledHeight,
        fit: BoxFit.contain,
      );
    }
  }
}
