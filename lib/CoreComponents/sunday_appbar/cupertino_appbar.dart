import 'package:flutter/cupertino.dart';

/// A custom implementation of a Cupertino-style app bar for Sunday app.
///
/// This widget provides a customizable app bar that follows the iOS design
/// guidelines and integrates well with the Sunday app's aesthetics.
class SundayCupertinoAppBar extends StatelessWidget {
  /// Widget to be placed at the start of the app bar.
  final Widget? leading;

  /// Whether to automatically add a back button if [leading] is null.
  final bool automaticallyImplyLeading;

  /// Widget to be placed in the middle of the app bar.
  final Widget? middle;

  /// Widget to be placed at the end of the app bar.
  final Widget? trailing;

  /// The border to be drawn at the bottom of the app bar.
  final Border? border;

  /// The background color of the app bar.
  final Color? backgroundColor;

  /// The brightness of the app bar, typically used to determine the color of
  /// the system UI overlays.
  final Brightness? brightness;

  /// The padding for the content inside the app bar.
  final EdgeInsetsDirectional? padding;

  /// Whether to animate the app bar when transitioning between routes.
  final bool transitionBetweenRoutes;

  /// Creates a [SundayCupertinoAppBar].
  ///
  /// The [automaticallyImplyLeading] and [transitionBetweenRoutes] arguments
  /// must not be null.
  const SundayCupertinoAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.middle,
    this.trailing,
    this.border,
    this.backgroundColor,
    this.brightness,
    this.padding,
    this.transitionBetweenRoutes = true,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: leading,
      middle: middle,
      trailing: trailing,
      border: border,
      backgroundColor: backgroundColor,
      brightness: brightness,
      padding: padding,
      transitionBetweenRoutes: transitionBetweenRoutes,
    );
  }
}
