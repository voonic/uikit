import 'package:flutter/material.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// An image class that is custom image widget for our project.
/// When any of the width or height param is 0, no size will be
/// passed and image will be rendered as it is by its own size.
///
/// If [width] and [height] is specified then the tabletScaleFactor
/// is applied on tablets.
///
/// ```dart
/// FlatImage(name: "logo.png", width: 300, height: 300),
/// ```
///
class FlatImage extends StatelessWidget {
  /// The name of the image that needs to be shown.
  final String name;

  /// The width of the image in dp.
  final double width;

  /// The height of the image in dp.
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
