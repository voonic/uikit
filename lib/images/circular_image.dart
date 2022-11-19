import 'package:flutter/material.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A circular image component that shows rounded image.
/// It's typically used for user Avatar. It uses radius to
/// define the size. You can specify the border size to show
/// border to the avatar. The borderSize is inclusive of the
/// size provided.
///
/// ```dart
/// CircularImage(imageURL: "http://ecastar.png", radius: 60),
/// ```
///
class CircularImage extends StatelessWidget {
  /// The color of the border.
  final Color borderColor;

  /// The width of the border.
  final double borderSize;

  /// The radius of the avatar.
  final double radius;

  /// The image that needs to shown to user.
  final String imageURL;

  const CircularImage({
    super.key,
    this.borderColor = colorWhite,
    this.borderSize = 0,
    required this.radius,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    double finalRadius =
        ScreenSize.isTablet() ? tabletScaleFactor * radius : radius;
    double finalBordersize =
        ScreenSize.isTablet() ? tabletScaleFactor * borderSize : borderSize;
    return CircleAvatar(
      backgroundColor: borderColor,
      radius: finalRadius,
      child: CircleAvatar(
        radius: finalRadius - finalBordersize,
        backgroundImage: NetworkImage(imageURL),
      ),
    );
  }
}
