import 'package:flutter/material.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A widget that creates a margined container in percentage accroding to the provided
/// margin direction. The size will be treated as percentage.
class MarginedContainer extends StatelessWidget {
  final double verticalPercentage;
  final double horizontalPercentage;
  final Widget child;

  const MarginedContainer({
    Key? key,
    required this.child,
    this.verticalPercentage = 0.0,
    this.horizontalPercentage = 0.0,
  }) : super(key: key);

  double _getHorizontalMarginPercentage() {
    double hMarginPercent = ScreenSize.isTablet()
        ? tabletScaleFactor * horizontalPercentage
        : horizontalPercentage;
    return hMarginPercent;
  }

  double _getVerticalMarginPercentage() {
    double vMarginPercent = ScreenSize.isTablet()
        ? tabletScaleFactor * verticalPercentage
        : verticalPercentage;
    return vMarginPercent;
  }

  @override
  Widget build(BuildContext context) {
    double marginWidth = 0;
    double marginHeight = 0;
    if (horizontalPercentage > 0.00 && verticalPercentage > 0.00) {
      marginWidth =
          (_getHorizontalMarginPercentage() / 100) * ScreenSize.getWidth();
      marginHeight =
          (_getVerticalMarginPercentage() / 100) * ScreenSize.getHeight();
    } else if (horizontalPercentage > 0.00) {
      marginWidth =
          (_getHorizontalMarginPercentage() / 100) * ScreenSize.getWidth();
    } else if (verticalPercentage > 0.00) {
      marginHeight =
          (_getVerticalMarginPercentage() / 100) * ScreenSize.getHeight();
    }
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: marginHeight, horizontal: marginWidth),
      child: child,
    );
  }
}
