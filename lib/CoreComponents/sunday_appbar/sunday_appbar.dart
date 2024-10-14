import 'package:flutter/material.dart';
import 'package:sunday_ui/CoreComponents/sunday_appbar/material_appbar.dart';
import 'package:sunday_ui/CoreComponents/sunday_appbar/cupertino_appbar.dart';
import 'package:sunday_ui/Scripts/preferences/get_key.dart';
import 'package:sunday_ui/Scripts/preferences/get_path.dart';
import 'package:sunday_ui/Scripts/preferences/change_key.dart';
import 'package:sunday_ui/style.dart';

/// A customizable app bar that adapts to different UI styles (Material, Cupertino, etc.).
class SundayAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// The UI style to be used for the app bar.
  final Style style;

  /// A widget to display before the [middle] widget.
  final Widget? leading;

  /// Controls whether we should try to imply the leading widget if null.
  final bool automaticallyImplyLeading;

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

  /// The primary content of the app bar.
  final Widget? middle;

  /// Creates a [SundayAppBar].
  ///
  /// The [style] argument must not be null.
  /// The [automaticallyImplyLeading] argument defaults to true.
  const SundayAppBar({
    super.key,
    required this.style,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.centerTitle,
    this.titleSpacing,
    this.toolbarOpacity,
    this.bottomOpacity,
    this.middle,
  });

  @override
  State<SundayAppBar> createState() => _SundayAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SundayAppBarState extends State<SundayAppBar> {
  @override
  void initState() {
    super.initState();
    initPlatform();
  }

  /// Initializes the platform-specific settings for the app bar.
  void initPlatform() async {
    if (!mounted) return;
    
    final path = getPath(context);
    var data = await getKey(path);
    if (data is Map) {
      if (!mounted) return;
      
      if (data['type'] != 'sunday_appbar' || data.isEmpty) {
        changeKey(path, {
          "backgroundColor": widget.backgroundColor?.toString(),
          "elevation": widget.elevation?.toString(),
          "brightness": widget.brightness?.toString(),
          "iconTheme": widget.iconTheme?.toString(),
          "actionsIconTheme": widget.actionsIconTheme?.toString(),
          "centerTitle": widget.centerTitle?.toString(),
          "titleSpacing": widget.titleSpacing?.toString(),
          "toolbarOpacity": widget.toolbarOpacity?.toString(),
          "bottomOpacity": widget.bottomOpacity?.toString(),
          "type": "sunday_appbar",
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.style) {
      case Style.material:
        return SundayMaterialAppBar(
          leading: widget.leading,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          actions: widget.actions,
          flexibleSpace: widget.flexibleSpace,
          bottom: widget.bottom,
          elevation: widget.elevation,
          backgroundColor: widget.backgroundColor,
          iconTheme: widget.iconTheme,
          actionsIconTheme: widget.actionsIconTheme,
          centerTitle: widget.centerTitle,
          titleSpacing: widget.titleSpacing,
          toolbarOpacity: widget.toolbarOpacity ?? 1.0,
          bottomOpacity: widget.bottomOpacity ?? 1.0,
          title: widget.middle,
        );
      case Style.cupertino:
      case Style.custom:
      case Style.latestIOS:
        return SundayCupertinoAppBar(
          leading: widget.leading,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          middle: widget.middle,
          trailing:
              widget.actions != null ? Row(children: widget.actions!) : null,
          backgroundColor: widget.backgroundColor,
          brightness: widget.brightness,
        );
      default:
        throw UnimplementedError('Unsupported style: ${widget.style}');
    }
  }
}
