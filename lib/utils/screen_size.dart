import 'package:flutter/material.dart';

/// Checks whether screen size is tablet or not.
class ScreenSize {
  static final _data =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  /// Returns a boolean specifying whether the given screen is tablet
  /// or not.
  static bool isTablet() {
    bool isTablet = _data.size.shortestSide < 600 ? false : true;
    return isTablet;
  }

  /// Returns the size of the screen.
  static double getWidth() {
    return _data.size.width;
  }

  /// Returns the height of the screen.
  static double getHeight() {
    return _data.size.height;
  }
}
