import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:uikit/buttons/button_type.dart';
import 'package:uikit/buttons/outline_buttons.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A widget that creates filled rounded pill button with 3d border.
/// Raised buttons takes full width of the parent always.
///
/// This button uses [nice_buttons](https://pub.dev/packages/nice_buttons)
/// package from pub.dev. This button package is 3d button library.
///
/// See also:
///
/// * [OutlineButtons] 3d buttons without background.
///
/// ```dart
/// RaisedButtons(
///   onTap: (Function next) {
///     console.log("Tapped")
///   },
///   buttonType: ButtonType.warning,
///   progress: true,
///   disabled: false,
///   child: constText("Raised Buttons"),
/// ),
/// ```
///
class RaisedButtons extends StatelessWidget {
  /// Specifies which color scheme to use.
  ///
  /// See also:
  /// * [ButtonType] that are available in this theme.
  final ButtonType buttonType;

  /// Whether a progress indicator is required on click or not.
  final bool progress;

  /// Specifies whether button is disabled or not.
  ///
  /// On being disabled the click event will not fire.
  final bool disabled;

  /// The function that will be called when this button is clicked.
  final Function onTap;

  /// The content of this button. Can be any valid flutter widget.
  final Widget child;

  /// The height of the button, default is 60 dp.
  final double height;

  /// The size of the circular progress indicator, default is 20 dp.
  final double indicatorSize;

  const RaisedButtons({
    Key? key,
    required this.onTap,
    required this.child,
    this.buttonType = ButtonType.primary,
    this.progress = false,
    this.disabled = false,
    this.height = 60.0,
    this.indicatorSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = colorPrimary;
    Color border = colorPrimaryDark;
    Color progressColor = colorWhite;
    double progressSize = ScreenSize.isTablet()
        ? tabletScaleFactor * indicatorSize
        : indicatorSize;
    double calculateHeight =
        ScreenSize.isTablet() ? tabletScaleFactor * height : height;
    if (buttonType == ButtonType.warning) {
      color = colorWarning;
      border = colorWarningDark;
    } else if (buttonType == ButtonType.success) {
      color = colorSuccess;
      border = colorSuccessDark;
    } else if (buttonType == ButtonType.white) {
      color = colorWhite;
      border = colorLight;
      progressColor = colorSilver;
    } else if (buttonType == ButtonType.danger) {
      color = colorDanger;
      border = colorDangerDark;
    }
    return NiceButtons(
      startColor: color,
      endColor: color,
      stretch: true,
      borderColor: border,
      progress: progress,
      progressSize: progressSize,
      progressColor: progressColor,
      gradientOrientation: GradientOrientation.Vertical,
      disabled: disabled,
      height: calculateHeight,
      borderRadius: calculateHeight / 2,
      onTap: (next) {
        onTap();
        next();
      },
      child: child,
    );
  }
}
