import 'package:flutter/material.dart';
import 'package:uikit/images/flat_image.dart';
import 'package:uikit/text/flat_text.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// An image badge component that shows image with text.
/// It cannot be used to render image from URL, only
/// app embedded image. It's typically used in the header
/// section. Image icon is assumed to be square thats why only height.
///
/// ```dart
/// ImageBadge(imageName: "star.png", value: "23"),
/// ```
///
class ImageBadge extends StatelessWidget {
  /// The height of the image, it considered as square.
  final double imageHeight;

  /// The name of the image.
  final String imageName;

  /// The text that needs to be shown.
  final String value;

  /// The color of the text.
  final Color valueColor;

  /// The size of the text in the dp.
  final double valueSize;

  /// A callback that will be triggred when this UI is tapped.
  ///
  /// If this has not been provided then it will not listen for
  /// gestures.
  final VoidCallback? onTap;

  const ImageBadge({
    Key? key,
    required this.imageName,
    required this.value,
    this.imageHeight = 30,
    this.valueSize = baseFontSizeSmall,
    this.valueColor = colorWhite,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double padding = ScreenSize.isTablet() ? tabletScaleFactor * 3 : 3;
    double borderRadius = ScreenSize.isTablet() ? tabletScaleFactor * 5 : 5;
    double minWidth = ScreenSize.isTablet() ? tabletScaleFactor * 70 : 70;
    double sizedBoxHeight =
        ScreenSize.isTablet() ? tabletScaleFactor * imageHeight : imageHeight;
    if (onTap == null) {
      return SizedBox(
        height: sizedBoxHeight,
        child: getInnerContent(padding, borderRadius, minWidth, sizedBoxHeight),
      );
    } else {
      return SizedBox(
        height: sizedBoxHeight,
        child: GestureDetector(
            onTap: onTap,
            child: getInnerContent(
                padding, borderRadius, minWidth, sizedBoxHeight)),
      );
    }
  }

  Widget getInnerContent(double padding, double borderRadius, double minWidth,
      double sizedBoxHeight) {
    return Stack(children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints(minWidth: minWidth),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [colorDark, colorDarkTranslucent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.1],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          padding: EdgeInsets.fromLTRB(
              sizedBoxHeight + padding, padding, padding * 2, padding),
          child: FlatText(
            value,
            size: valueSize,
            color: valueColor,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      FlatImage(
        name: imageName,
        width: imageHeight,
        height: imageHeight,
      ),
    ]);
  }
}
