import 'package:flutter/material.dart';

/// A custom implementation of Material Design app bar.
///
/// This widget implements the basic Material Design visual layout structure for
/// the app bar at the top of the screen. It's designed to be used as a direct
/// replacement for Flutter's [AppBar] with identical properties and behavior.
class SundayMaterialAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// A widget to display before the [title].
  final Widget? leading;

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and [leading] is null, automatically try to deduce what the leading
  /// widget should be. If false and [leading] is null, leading space is given to [title].
  /// If leading widget is not null, this parameter has no effect.
  final bool automaticallyImplyLeading;

  /// The primary widget displayed in the app bar.
  ///
  /// Typically a [Text] widget containing a description of the current contents of the app.
  final Widget? title;

  /// Widgets to display in a row after the [title] widget.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  final List<Widget>? actions;

  /// This widget is stacked behind the toolbar and the tab bar. It's height will
  /// be the same as the app bar's overall height.
  final Widget? flexibleSpace;

  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  final PreferredSizeWidget? bottom;

  /// The z-coordinate at which to place this app bar relative to its parent.
  ///
  /// This controls the size of the shadow below the app bar.
  final double? elevation;

  /// The color to paint the shadow below the app bar.
  final Color? shadowColor;

  /// The shape of the app bar's material's shape as well as its shadow.
  final ShapeBorder? shape;

  /// The color to use for the app bar's material. Typically this should be set
  /// along with [brightness], [iconTheme], [textTheme].
  final Color? backgroundColor;

  /// The default color for [Text] and [Icon]s within the app bar.
  final Color? foregroundColor;

  /// The color, opacity, and size to use for app bar icons.
  final IconThemeData? iconTheme;

  /// The color, opacity, and size to use for the icons that appear in the app
  /// bar's [actions].
  final IconThemeData? actionsIconTheme;

  /// Whether this app bar is being displayed at the top of the screen.
  ///
  /// If true, the app bar's toolbar elements and [bottom] widget will be
  /// padded on top by the height of the system status bar. The layout
  /// of the [flexibleSpace] is not affected by the [primary] property.
  final bool primary;

  /// Whether the title should be centered.
  final bool? centerTitle;

  /// Whether the title should be wrapped with header [Semantics].
  final bool excludeHeaderSemantics;

  /// The spacing around [title] content on the horizontal axis. This spacing is
  /// applied even if there is no [leading] content or [actions]. If you want
  /// [title] to take all the space available, set this value to 0.0.
  final double? titleSpacing;

  /// How opaque the toolbar part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  final double toolbarOpacity;

  /// How opaque the bottom part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  final double bottomOpacity;

  /// Defines the height of the toolbar component of an [AppBar].
  final double? toolbarHeight;

  /// Defines the width of [leading] widget.
  final double? leadingWidth;

  /// The default text style for the AppBar's [title] widget.
  final TextStyle? titleTextStyle;

  /// Whether the material should not paint the appbar background.
  final bool forceMaterialTransparency;

  /// Creates a [SundayMaterialAppBar].
  ///
  /// The arguments [primary], [toolbarOpacity], [bottomOpacity],
  /// [automaticallyImplyLeading], and [excludeHeaderSemantics] must
  /// not be null.
  const SundayMaterialAppBar({
    super.key,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shadowColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.titleTextStyle,
    this.forceMaterialTransparency = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      centerTitle: centerTitle,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      titleTextStyle: titleTextStyle,
      forceMaterialTransparency: forceMaterialTransparency,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
