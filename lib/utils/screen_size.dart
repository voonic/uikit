import 'package:flutter/material.dart';

/// Checks whether screen size is tablet or not.
class ScreenSize {
  static final _data =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window);

  static bool isTablet() {
    bool isTablet = _data.size.shortestSide < 600 ? false : true;
    return isTablet;
  }

  static double getWidth() {
    return _data.size.width;
  }

  static double getHeight() {
    return _data.size.height;
  }
}
