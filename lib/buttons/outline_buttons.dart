import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:uikit/buttons/button_type.dart';
import 'package:uikit/buttons/raised_buttons.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A widget that creates outlined rounded pill buttons.
/// By default the color is primary. Outline buttons only have
/// borders and transparent background. Outline buttons takes
/// full width of the parent always.
///
/// This button uses [nice_buttons](https://pub.dev/packages/nice_buttons)
/// package from pub.dev. This button package is 3d button library.
///
/// See also:
///
/// * [RaisedButtons] 3d buttons with background.
///
/// ```dart
/// OutlineButtons(
///   onTap: (Function next) {
///     print("tapped");
///     //When progress is enabled, call next to hide the progress whe you are done.
///   },
///   buttonType: ButtonType.white,
///   progress: true,
///   disabled: false,
///   child: const Text("Outline Buttons"),
/// )
/// ```
///
class OutlineButtons extends StatelessWidget {
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

  /// The border thickness, default is 3 dp.
  final double border;

  /// The size of the circular progress indicator, default is 20 dp.
  final double indicatorSize;

  const OutlineButtons({
    Key? key,
    required this.onTap,
    required this.child,
    this.buttonType = ButtonType.primary,
    this.disabled = false,
    this.progress = false,
    this.height = 60.0,
    this.border = 3.0,
    this.indicatorSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = colorPrimary;
    Color progressColor = colorWhite;
    double progressSize = ScreenSize.isTablet()
        ? tabletScaleFactor * indicatorSize
        : indicatorSize;
    double borderWidth =
        ScreenSize.isTablet() ? tabletScaleFactor * border : border;
    double containerHeight =
        ScreenSize.isTablet() ? tabletScaleFactor * height : height;
    double calculateHeight = containerHeight - (borderWidth * 2);
    if (buttonType == ButtonType.warning) {
      color = colorWarning;
    } else if (buttonType == ButtonType.success) {
      color = colorSuccess;
    } else if (buttonType == ButtonType.white) {
      color = colorWhite;
    } else if (buttonType == ButtonType.danger) {
      color = colorDanger;
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth,
          color: color,
        ),
        borderRadius: BorderRadius.circular(containerHeight / 2),
      ),
      child: NiceButtons(
        startColor: colorTransparent,
        endColor: colorTransparent,
        stretch: true,
        borderColor: colorTransparent,
        borderThickness: 1,
        progress: progress,
        progressColor: progressColor,
        progressSize: progressSize,
        gradientOrientation: GradientOrientation.Vertical,
        disabled: disabled,
        height: calculateHeight,
        borderRadius: calculateHeight / 2,
        onTap: (next) {
          onTap();
          next();
        },
        child: child,
      ),
    );
  }
}
