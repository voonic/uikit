import 'package:flutter/material.dart';
import 'package:uikit/components/flat_gap.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/settings.dart';
import '../components/flat_icons.dart';
import 'flat_text.dart';

/// A class that draws icons with text align together horizontally.
///
/// Specifying icon multiplier will multiply in the size factor.
/// Icon color will change the color of the icon. color will change the
/// text color.
///
/// ```dart
/// IconsText(
///  icon: Icons.facebook_rounded,
///  iconColor: colorPrimaryDark,
///  iconMultiplier: 2,
///  text: Strings.playFacebook,
///  color: colorWhite,
/// ),
/// ```
///
class IconText extends StatelessWidget {
  /// The icon that needs to be displayed.
  final IconData icon;

  /// The icon multiplier.
  ///
  /// In case if you need same as as text size, leave it
  /// to default as 1.0
  final double iconMultiplier;

  /// The text that needs to be shown.
  final String text;

  /// The size of the text.
  final double size;

  /// The color of the text.
  final Color color;

  /// The color of the icon.
  final Color iconColor;

  const IconText({
    Key? key,
    required this.icon,
    required this.text,
    this.size = baseFontSize,
    this.iconMultiplier = 1.0,
    this.color = colorDark,
    this.iconColor = colorDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FlatIcon(
          icon,
          color: iconColor,
          size: size * iconMultiplier,
        ),
        const FlatGap(size: 10, gapType: GapType.horizontal),
        FlatText(
          text,
          color: color,
          size: size,
        ),
      ],
    );
  }
}
