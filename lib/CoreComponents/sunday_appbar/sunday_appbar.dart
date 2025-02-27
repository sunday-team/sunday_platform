import 'package:flutter/material.dart';
import 'package:sunday_platform/CoreComponents/sunday_appbar/fluent_appbar.dart';
import 'package:sunday_platform/CoreComponents/sunday_appbar/macos_appbar.dart';
import 'package:sunday_platform/CoreComponents/sunday_appbar/material_appbar.dart';
import 'package:sunday_platform/CoreComponents/sunday_appbar/cupertino_appbar.dart';
import 'package:sunday_platform/style.dart';
import 'package:sunday_platform/sunday_config.dart';

/// A customizable app bar that adapts to different UI styles (Material, Cupertino, etc.).
class SundayAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// The primary content of the app bar.
  final Widget middle;

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

  /// The height of the app bar.
  /// Defaults to [kToolbarHeight].
  final double height;

  /// The alignment of the app bar's content.
  /// Defaults to [Alignment.center].
  final Alignment alignment;

  /// The width of the title widget.
  /// Defaults to 52.0.
  final double titleWidth;

  /// The padding for the content inside the app bar.
  /// Defaults to [EdgeInsets.symmetric(horizontal: 8, vertical: 4.0)].
  final EdgeInsets padding;

  /// The decoration to paint behind the app bar.
  /// Defaults to null.
  final BoxDecoration? decoration;

  /// The color of the divider between the app bar and the content.
  /// Defaults to null.
  final Color? dividerColor;

  /// Whether to allow wallpaper tinting overrides.
  /// Defaults to true.
  final bool allowWallpaperTintingOverrides;

  /// Whether to enable blur.
  /// Defaults to false.
  final bool enableBlur;

  /// Title of the appbar
  final Widget? title;

  /// The border to be drawn at the bottom of the app bar.
  final Border? border;

  /// The padding for the content inside the app bar.
  final EdgeInsetsDirectional? directionalPadding;

  /// Whether the navigation bar should be automatically sized.
  final bool automaticallyImplyMiddle;

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

  /// Creates a [SundayAppBar].
  ///
  /// The [style] and [middle] arguments must not be null.
  /// The [automaticallyImplyLeading] argument defaults to true.
  const SundayAppBar({
    super.key,
    required this.middle,
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
    this.height = 150.0,
    this.alignment = Alignment.center,
    this.titleWidth = 52.0,
    this.padding = const EdgeInsets.all(0),
    this.decoration,
    this.dividerColor,
    this.allowWallpaperTintingOverrides = true,
    this.enableBlur = false,
    this.title,
    this.border,
    this.directionalPadding,
    this.automaticallyImplyMiddle = true,
    this.previousPageTitle,
    this.translucentNavigationBar = true,
    this.backgroundColorOpacity = 1.0,
    this.largeTitleEnabled = false,
    this.largeTitle,
    this.largeTitleTextStyle,
    this.automaticBackgroundVisibility = true,
  });

  @override
  Widget build(BuildContext context) {
    final config = SundayConfigWidget.of(context);
    switch (config.uiStyle) {
      case Style.fluent:
        return SundayFluentAppBar(
          middle: middle,
          leading: leading,
          height: height,
          trailing: trailing,
          actions: actions,
        );
      case Style.material:
        return SundayMaterialAppBar(
          foregroundColor: backgroundColor,
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
      case Style.macos:
        return SundayMacOSAppBar(
          height: height,
          alignment: alignment,
          title: title,
          titleWidth: titleWidth,
          padding: padding,
          decoration: decoration,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          // actions: [
          //   if (trailing != null)
          //     ToolBarIconButton(label: label, icon: icon, showLabel: showLabel),
          //   if (actions != null) ...actions!,
          // ],
        );
      case Style.latestIOS:
        return SundayCupertinoAppBar(
          transitionBetweenRoutes: transitionBetweenRoutes,
          middle: middle,
          leading: leading,
          trailing: Row(
            children: [...(actions ?? [])],
          ),
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: backgroundColor,
          brightness: brightness,
          heroTag: heroTag ?? '${context.hashCode}_app_bar',
          automaticallyImplyMiddle: automaticallyImplyMiddle,
          actions: actions,
          previousPageTitle: previousPageTitle,
          translucentNavigationBar: translucentNavigationBar,
          backgroundColorOpacity: backgroundColorOpacity,
          largeTitleEnabled: largeTitleEnabled,
          largeTitle: largeTitle,
          largeTitleTextStyle: largeTitleTextStyle,
          automaticBackgroundVisibility: automaticBackgroundVisibility,
          enableBackgroundFilterBlur: enableBlur,
          bottom: bottom,
          border: border,
          padding: directionalPadding,
        );
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
