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

  /// The hero tag for the app bar.
  final String heroTag;

  /// Whether the navigation bar should be automatically sized.
  final bool automaticallyImplyMiddle;

  /// List of action widgets to display on the trailing side.
  final List<Widget>? actions;

  /// Custom back button icon.
  final String? previousPageTitle;

  /// Whether the navigation bar is translucent.
  final bool? translucentNavigationBar;

  /// The opacity of the navigation bar's background color.
  final double? backgroundColorOpacity;

  /// Whether to show a large title.
  final bool largeTitleEnabled;

  /// The large title widget.
  final Widget? largeTitle;

  /// The style for the large title.
  final TextStyle? largeTitleTextStyle;

  /// Whether the background should automatically adjust visibility.
  final bool automaticBackgroundVisibility;

  /// Whether to enable background filter blur effect.
  final bool enableBackgroundFilterBlur;

  /// PreferredSizeWidget to be displayed at the bottom of the navigation bar.
  final PreferredSizeWidget? bottom;

  /// Creates a [SundayCupertinoAppBar].
  ///
  /// The [automaticallyImplyLeading] argument
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
    required this.heroTag,
    this.automaticallyImplyMiddle = true,
    this.actions,
    this.previousPageTitle,
    this.translucentNavigationBar = true,
    this.backgroundColorOpacity = 1.0,
    this.largeTitleEnabled = false,
    this.largeTitle,
    this.largeTitleTextStyle,
    this.automaticBackgroundVisibility = false,
    this.enableBackgroundFilterBlur = true,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      automaticallyImplyMiddle: automaticallyImplyMiddle,
      previousPageTitle: previousPageTitle,
      middle: middle,
      trailing: trailing,
      border: border,
      backgroundColor: backgroundColor,
      brightness: brightness,
      padding: padding,
      transitionBetweenRoutes: transitionBetweenRoutes,
      heroTag: heroTag,
      automaticBackgroundVisibility: automaticBackgroundVisibility,
      enableBackgroundFilterBlur: enableBackgroundFilterBlur,
    );
  }
}
