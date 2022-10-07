import 'package:flutter/material.dart';
import 'package:uikit/utils/colors.dart';

/// A component that shows primary ocean green and blue gradient activity background.
/// This is background uses ocean colors as gradient and should be used
/// when this gradient is required, currently used on login screen.
class ActivityBackground extends StatelessWidget {
  final Widget child;
  const ActivityBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorAccent,
            colorPrimary,
          ],
        ),
      ),
      child: child,
    );
  }
}
