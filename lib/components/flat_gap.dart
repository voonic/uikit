import 'package:flutter/material.dart';
import 'package:uikit/utils/screen_size.dart';
import 'package:uikit/utils/settings.dart';

/// Defines the direction of the gap.
///
/// [horizontal] gives you gap horizontally,
/// [vertical] gives a gap vertically between the views.
enum GapType {
  horizontal,
  vertical,
}

/// A gap class that uses padding to create a empty component
/// with fixed horizontal or vertical gap. The gap unit [size] is in dp.
///
///```dart
/// FlatGap(
///   size: 10,
///   gapType: GapType.vertical,
/// )
///```
class FlatGap extends StatelessWidget {
  final double size;
  final GapType gapType;

  const FlatGap({
    Key? key,
    required this.size,
    required this.gapType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gapSize = ScreenSize.isTablet() ? tabletScaleFactor * size : size;
    if (gapType == GapType.vertical) {
      return Padding(padding: EdgeInsets.symmetric(vertical: gapSize / 2));
    } else {
      return Padding(padding: EdgeInsets.symmetric(horizontal: gapSize / 2));
    }
  }
}
