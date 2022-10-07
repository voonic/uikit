import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';
import 'package:uikit/components/button_type.dart';
import 'package:uikit/utils/colors.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A widget that creates outlined rounded pill button, default is primary button type.
class OutlineButtons extends StatelessWidget {
  final ButtonType buttonType;
  final bool progress;
  final bool disabled;
  final Function onTap;
  final Widget child;
  final double defaultHeight = 60.0;
  final double defaultBorder = 3.0;
  final double defaultProgressSize = 20;

  const OutlineButtons({
    Key? key,
    required this.onTap,
    required this.child,
    this.buttonType = ButtonType.primary,
    this.disabled = false,
    this.progress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = colorPrimary;
    Color progressColor = colorWhite;
    double progressSize = ScreenSize.isTablet()
        ? tabletScaleFactor * defaultProgressSize
        : defaultProgressSize;
    double borderWidth = ScreenSize.isTablet()
        ? tabletScaleFactor * defaultBorder
        : defaultBorder;
    double containerHeight = ScreenSize.isTablet()
        ? tabletScaleFactor * defaultHeight
        : defaultHeight;
    double height = containerHeight - (borderWidth * 2);
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
        height: height,
        borderRadius: height / 2,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
