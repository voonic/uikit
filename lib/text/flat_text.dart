import 'package:flutter/material.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A text class that can be used for showing normal text in the screens.
/// The size of the text is responsive for tablets and will increase
/// as per multiplication factor provided in the settings.
///
/// For tablet it automatically increases the size of the font based on the
/// tablet multiplication factor in settings. The text can be made
/// clickable by providing [onClick] function.
///
/// ```dart
/// FlatText("This is my text")
/// ```
///
/// ```dart
/// FlatText(
///   "whatever text",
///   size: 12,
///   color: colorWhite,
/// )
/// ```
///
class FlatText extends StatelessWidget {
  /// The text that needs to be shown.
  final String text;

  /// The size of the text.
  final double size;

  /// The font weight of the text.
  final FontWeight fontWeight;

  /// The color of the text.
  final Color color;

  /// The alignment of the text.
  final TextAlign textAlign;

  /// The click callback, if provided then the text becomes clickable.
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
