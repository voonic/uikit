import 'package:flutter/material.dart';

/// A container widget that takes the full available space in the parent.
///
/// ```dart
/// NormalContainer(
///   child: Text("Gradient Container")
///   padding: const EdgeInsets.all(8.0),
/// )
/// ```
///
class NormalContainer extends StatelessWidget {
  /// The [child] contained by the container.
  final Widget child;

  /// A gradient property that can be applied to background.
  ///
  /// This can be used to change the background color of the
  /// container.
  final Gradient? gradient;

  /// Adds the desired padding to the container.
  ///
  /// By default it's null, so nothing is applied.
  final EdgeInsets? padding;

  /// Adds the desired border radius to the container.
  ///
  /// By default it's null, so nothing is applied.
  final BorderRadius? borderRadius;

  const NormalContainer({
    Key? key,
    required this.child,
    this.padding,
    this.gradient,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: gradient,
      ),
      child: child,
    );
  }
}
