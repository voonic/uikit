import 'package:flutter/material.dart';
import 'package:uikit/components/flat_gap.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/settings.dart';
import 'flat_icons.dart';
import 'flat_text.dart';

/// A class that draws icons with text align together horizontally.
/// Specifying icon multiplier will multiply in the size factor.
/// Icon color will change the color of the icon. color will change the
/// text color.
class IconsText extends StatelessWidget {
  final IconData icon;
  final double iconMultiplier;
  final String text;
  final double size;
  final Color color;
  final Color iconColor;

  const IconsText({
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
