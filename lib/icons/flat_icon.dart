import 'package:flutter/material.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// An icon class that can be used for showing icons in the screens.
///
/// For tablet it automatically increases the size of the icon based on the
/// tabletScaleFactor in settings. By default it uses [baseFontSize] defined
/// in the settings and the default color is the [colorDark] in settings.
///
/// ```dart
/// FlatIcon(
///   icon,
///   color: iconColor,
///   size: 20,
/// ),
/// ```
///
class FlatIcon extends StatelessWidget {
  /// The icon that needs to be shown.
  final IconData icon;

  /// The size of the icon in dp.
  final double size;

  /// The color of the icon.
  final Color color;

  const FlatIcon(
    this.icon, {
    Key? key,
    this.size = baseFontSize,
    this.color = colorDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = ScreenSize.isTablet() ? tabletScaleFactor * size : size;
    return Icon(
      icon,
      color: color,
      size: iconSize,
    );
  }
}
