import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:sunday_platform/CoreComponents/sunday_scaffold/cupertino_scaffold.dart';
import 'package:sunday_platform/CoreComponents/sunday_scaffold/fluent_scaffold.dart';
import 'package:sunday_platform/CoreComponents/sunday_scaffold/macos_scaffold.dart';
import 'package:sunday_platform/CoreComponents/sunday_scaffold/material_scaffold.dart';
import 'package:sunday_platform/style.dart';

/// A scaffold widget that adapts to different UI styles (Material, Cupertino, etc.).
///
/// This widget provides a consistent structure for pages in the Sunday app,
/// adapting to the specified UI style.
class SundayScaffold extends StatelessWidget {
  /// Creates a [SundayScaffold].
  ///
  /// The [style], [appBar], and [child] parameters must not be null.
  const SundayScaffold({
    super.key,
    required this.style,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    this.appBar,
    required this.child,
  });

  /// The UI style to use for this scaffold.
  final Style style;

  /// Whether the [child] should resize when the keyboard appears.
  final bool? resizeToAvoidBottomInset;

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// The primary content of the scaffold.
  final Widget child;

  /// The app bar to display at the top of the scaffold.
  final dynamic appBar;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.fluent:
        return SundayFluentScaffold(
          appbar: appBar,
            child: child);
      case Style.material:
        return SundayMaterialScaffold(
          appBar: appBar,
          body: child,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
        );
      case Style.cupertino:
      case Style.latestIOS:
        return SundayCupertinoScaffold(
          navigationBar: appBar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
          backgroundColor: backgroundColor,
          child: child,
        );
      case Style.macos:
        return SundayMacOSScaffold(
          appBar: appBar == null
              ? null
              : ToolBar(
                  leading: appBar?.leading ?? const SizedBox(),
                  title: appBar?.title ?? appBar?.middle ?? const SizedBox(),
                  height: appBar?.preferredSize?.height ?? 10,
                  alignment: appBar?.alignment ?? Alignment.center,
                  titleWidth: appBar?.titleWidth ?? 10,
                  padding: appBar?.padding ?? const EdgeInsets.all(0),
                  decoration: appBar?.decoration,
                  automaticallyImplyLeading:
                      appBar?.automaticallyImplyLeading ?? true,
                  actions: appBar?.actions,
                  centerTitle: appBar?.centerTitle ?? false,
                  dividerColor: appBar?.dividerColor,
                  allowWallpaperTintingOverrides:
                      appBar?.allowWallpaperTintingOverrides ?? true,
                  enableBlur: appBar?.enableBlur ?? false,
                ),
          body: child,
          backgroundColor: backgroundColor,
        );
    }
  }
}
