import 'package:flutter/material.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A flat text class that can be used for showing normal text in the screens.
/// For tablet it automatically increases the size of the font based on the
/// multiplication factor in settings.
class FlatText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final VoidCallback? onClick;

  const FlatText(
    this.text, {
    Key? key,
    this.size = baseFontSize,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.color = colorDark,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textSize = ScreenSize.isTablet() ? tabletScaleFactor * size : size;
    return Container(
      child: onClick == null
          ? Text(
              text,
              textAlign: textAlign,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: fontWeight,
                color: color,
              ),
            )
          : TextButton(
              onPressed: () {
                onClick?.call();
              },
              child: Text(
                text,
                textAlign: textAlign,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: fontWeight,
                  color: color,
                ),
              ),
            ),
    );
  }
}
