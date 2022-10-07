import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:uikit/components/button_type.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A widget that creates flat rounded pill button with 3d border, default is primary button type.
class RaisedButtons extends StatelessWidget {
  final ButtonType buttonType;
  final bool progress;
  final bool disabled;
  final Function onTap;
  final Widget child;
  final double defaultHeight = 60.0;
  final double defaultProgressSize = 20;

  const RaisedButtons({
    Key? key,
    required this.onTap,
    required this.child,
    this.buttonType = ButtonType.primary,
    this.progress = false,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = colorPrimary;
    Color border = colorPrimaryDark;
    Color progressColor = colorWhite;
    double progressSize = ScreenSize.isTablet()
        ? tabletScaleFactor * defaultProgressSize
        : defaultProgressSize;
    double height = ScreenSize.isTablet()
        ? tabletScaleFactor * defaultHeight
        : defaultHeight;
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
      height: height,
      borderRadius: height / 2,
      onTap: onTap,
      child: child,
    );
  }
}
