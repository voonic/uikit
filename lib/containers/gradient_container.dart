import 'package:flutter/material.dart';
import 'package:uikit/containers/normal_container.dart';
import 'package:uikit/utils/colors.dart';

/// A container widget that draws a gradient color background
/// behind the child, takes the full available space in the parent.
///
/// These container are supposed to fill the parent widget in
/// terms of width and height. By default it draws the vertical
/// diagonal gradient (top left to bottom right). with the default
/// colors [colorAccent] and [colorPrimary]. The direction of the
/// gradient chan be changed by changing the [begin] and [end] params.
/// But it only supports linear gradient as of now.
///
/// ```dart
/// GradientContainer(
///   child: Text("Gradient Container")
///   padding: const EdgeInsets.all(8.0),
///   begin: begin,
///   end: end,
/// )
/// ```
///
/// ```dart
/// GradientContainer(
///   child: Text("Gradient Container")
///   padding: const EdgeInsets.all(8.0),
///   begin: begin,
///   end: end,
///   borderRadius: BorderRadius.all(Radius.circular(10)),
///   padding: EdgeInsets.all(10),
/// )
/// ```
///
class GradientContainer extends StatelessWidget {
  /// The [child] contained by the container.
  final Widget child;

  /// The list of color stops in the gradient.
  ///
  /// By default it has two stops [colorAccent] and [colorPrimary].
  final List<Color> colors;

  /// The alignment from where the gradient will begin.
  ///
  /// This can be modified to get desired gradient effect in
  /// horizontal direction.
  final Alignment begin;

  /// The alignment from where the gradient will end.
  ///
  /// This can be modified to get desired gradient effect in
  /// horizontal direction.
  final Alignment end;

  /// Adds the desired padding to the container.
  ///
  /// By default it's null, so nothing is applied.
  final EdgeInsets? padding;

  /// Adds the desired border radius to the container.
  ///
  /// By default it's null, so nothing is applied.
  final BorderRadius? borderRadius;

  const GradientContainer({
    Key? key,
    required this.child,
    this.colors = const [colorAccent, colorPrimary],
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalContainer(
      padding: padding,
      borderRadius: borderRadius,
      gradient: LinearGradient(
        begin: begin,
        end: end,
        colors: colors,
      ),
      child: child,
    );
  }
}
