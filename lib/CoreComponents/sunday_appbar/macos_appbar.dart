import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

/// A custom implementation of a MacOS-style app bar for Sunday app.
///
/// This widget provides a customizable app bar that follows the macOS design
/// guidelines and integrates well with the Sunday app's aesthetics.
class SundayMacOSAppBar extends StatelessWidget {
  /// Specifies the height of this [ToolBar].
  ///
  /// Defaults to [_kToolbarHeight] which is 52.0.
  final double height;

  /// Aligns the [title] within the [ToolBar].
  ///
  /// Defaults to [Alignment.center].
  ///
  /// The [ToolBar] will expand to fill its parent and position its
  /// child within itself according to the given value.
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final Alignment alignment;

  /// The [title] of the toolbar.
  ///
  /// Typically, a [Text] widget.
  final Widget? title;

  /// Specifies the width of the title of the [ToolBar].
  ///
  /// Defaults to [_kTitleWidth] which is 150.0.
  final double titleWidth;

  /// The decoration to paint behind the [title].
  final BoxDecoration? decoration;

  /// Empty space to inscribe inside the toolbar. The [title], if any, is
  /// placed inside this padding.
  ///
  /// Defaults to ` EdgeInsets.symmetric(horizontal: 8, vertical: 4.0)`.
  final EdgeInsets padding;

  /// A widget to display before the toolbar's [title].
  ///
  /// Typically the [leading] widget is a [MacosIcon] or a [MacosIconButton].
  final Widget? leading;

  /// Controls whether the toolbar should try to imply if the [leading] widget
  /// is null.
  ///
  /// If `true` and [leading] are null, the toolbar will automatically try to
  /// deduce what the leading widget should be. If `false` and [leading] is
  /// null, leading space is given to [title]. If the [leading] widget is not
  /// null, this parameter has no effect.
  final bool automaticallyImplyLeading;

  /// A list of [ToolbarItem] widgets to display in a row after the [title]
  /// widget, as the toolbar actions.
  ///
  /// Toolbar items include [ToolBarIconButton], [ToolBarPulldownButton],
  /// [ToolBarSpacer], and [CustomToolbarItem] widgets.
  ///
  /// If the toolbar actions exceed the available toolbar width (e.g. when the
  /// window is resized), the overflowed actions are displayed via a
  /// [ToolbarOverflowMenu], that can be opened from the [ToolbarOverflowButton]
  /// at the right edge of the toolbar.
  final List<ToolbarItem>? actions;

  /// Whether the [title] should be centered.
  final bool centerTitle;

  /// The color of the divider below the toolbar.
  ///
  /// Defaults to `MacosTheme.of(context).dividerColor`.
  ///
  /// Set this to `MacosColors.transparent` to remove.
  final Color? dividerColor;

  /// Whether this [ToolBar] is allowed to perform wallpaper tinting overrides.
  ///
  /// This property is supposed to be set to true when this [ToolBar] is
  /// currently visible on the screen (that is, not e.g. hidden by an
  /// [IndexedStack]).
  ///
  /// This parameter only needs to be supplied when [enableBlur] is true.
  ///
  /// By default, macos_ui applies wallpaper tinting to the application's
  /// window to match macOS' native appearance:
  ///
  /// <img src="https://user-images.githubusercontent.com/86920182/220182724-d78319d7-5c41-4e8c-b785-a73a6ea24927.jpg" width=640/>
  ///
  /// However, this effect is realized by inserting `NSVisualEffectView`s behind
  /// Flutter's canvas and turning the background of areas that are meant to be
  /// affected by wallpaper tinting transparent. Since Flutter's
  /// [`ImageFilter.blur`](https://api.flutter.dev/flutter/dart-ui/ImageFilter/ImageFilter.blur.html)
  /// does not support transparency, wallpaper tinting is disabled automatically
  /// when this widget's [enableBlur] and [allowWallpaperTintingOverrides] is
  /// true.
  ///
  /// This is meant to be a temporary solution until
  /// [#16296](https://github.com/flutter/flutter/issues/16296) is resolved in
  /// the Flutter project.
  final bool allowWallpaperTintingOverrides;

  /// Whether this [ToolBar] should have a blur backdrop filter applied to it.
  final bool enableBlur;

  /// Creates a [SundayCupertinoAppBar].
  ///
  /// The [automaticallyImplyLeading] and [transitionBetweenRoutes] arguments
  /// must not be null.
  const SundayMacOSAppBar({
    super.key,
    this.height = 52.0,
    this.alignment = Alignment.center,
    this.title,
    this.titleWidth = 150.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
    this.decoration,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.centerTitle = false,
    this.dividerColor,
    this.allowWallpaperTintingOverrides = true,
    this.enableBlur = false,
  });

  @override
  Widget build(BuildContext context) {
    return ToolBar(
      height: height,
      titleWidth: titleWidth,
      actions: actions,
      leading: leading,
      title: title,
      padding: padding,
      allowWallpaperTintingOverrides: allowWallpaperTintingOverrides,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
