import 'package:flutter/material.dart';
import 'package:sunday_ui/CoreComponents/sunday_appbar/material_appbar.dart';
import 'package:sunday_ui/CoreComponents/sunday_appbar/cupertino_appbar.dart';
import 'package:sunday_ui/style.dart';

/// A customizable app bar that adapts to different UI styles (Material, Cupertino, etc.).
class SundayAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The primary content of the app bar.
  final Widget middle;

  /// The UI style to be used for the app bar.
  final Style style;

  /// A widget to display before the [middle] widget.
  final Widget? leading;

  /// A widget to display after the [middle] widget.
  final Widget? trailing;

  /// Controls whether we should try to imply the leading widget if null.
  final bool automaticallyImplyLeading;

  /// Optional hero tag for the app bar.
  final String? heroTag;

  /// A list of Widgets to display in a row after the [middle] widget.
  final List<Widget>? actions;

  /// This widget is stacked behind the toolbar and the tab bar.
  final Widget? flexibleSpace;

  /// This widget appears across the bottom of the app bar.
  final PreferredSizeWidget? bottom;

  /// The z-coordinate at which to place this app bar relative to its parent.
  final double? elevation;

  /// The color to use for the app bar's material.
  final Color? backgroundColor;

  /// The brightness of the app bar's material.
  final Brightness? brightness;

  /// The color, opacity, and size to use for app bar icons.
  final IconThemeData? iconTheme;

  /// The color, opacity, and size to use for trailing action icons.
  final IconThemeData? actionsIconTheme;

  /// Whether the title should be centered.
  final bool? centerTitle;

  /// The spacing around [middle] content on the horizontal axis.
  final double? titleSpacing;

  /// How opaque the toolbar part of the app bar is.
  final double? toolbarOpacity;

  /// How opaque the bottom part of the app bar is.
  final double? bottomOpacity;

  /// Whether to transition between routes when the app bar is tapped.
  final bool transitionBetweenRoutes;

  /// Creates a [SundayAppBar].
  ///
  /// The [style] and [middle] arguments must not be null.
  /// The [automaticallyImplyLeading] argument defaults to true.
  const SundayAppBar({
    super.key,
    required this.middle,
    required this.style,
    this.leading,
    this.trailing,
    this.automaticallyImplyLeading = true,
    this.heroTag,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.backgroundColor,
    this.brightness,
    this.elevation,
    this.iconTheme,
    this.actionsIconTheme,
    this.centerTitle,
    this.titleSpacing,
    this.toolbarOpacity,
    this.bottomOpacity,
    this.transitionBetweenRoutes = true,
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.material:
        return SundayMaterialAppBar(
          title: middle,
          leading: leading,
          actions: trailing != null ? [trailing!, ...(actions ?? [])] : actions,
          automaticallyImplyLeading: automaticallyImplyLeading,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          backgroundColor: backgroundColor,
          elevation: elevation,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity ?? 1.0,
          bottomOpacity: bottomOpacity ?? 1.0,
        );
      case Style.cupertino:
      case Style.custom:
      case Style.latestIOS:
        return SundayCupertinoAppBar(
          transitionBetweenRoutes: transitionBetweenRoutes,
          middle: middle,
          leading: leading,
          trailing: trailing,
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: backgroundColor,
          brightness: brightness,
          heroTag: heroTag ?? '${context.hashCode}_app_bar',
        );
      }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
