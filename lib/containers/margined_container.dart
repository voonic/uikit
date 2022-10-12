import 'package:flutter/material.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// A widget that creates a margined container in percentage according
/// to the provided size and direction. The size will be treated in
/// percentage.
///
/// To specify vertical margin use [verticalPercentage]
/// and to specify horizontal margin use [horizontalPercentage].
/// [child] can be any valid flutter widget. There is no
/// way to specify only left or top margins alone. You must
/// use in combinations, (top and bottom) or (left and right).
///
///  ```dart
/// MarginedContainer(
///   child: Text("Margined Container")
///   verticalPercentage: 10,
///   horizontalPercentage: 10,
/// )
/// ```
class MarginedContainer extends StatelessWidget {
  /// The vertical margin values in percentage.
  final double verticalPercentage;

  /// The horizontal margin values in percentage.
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
