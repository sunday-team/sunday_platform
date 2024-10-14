import 'package:flutter/cupertino.dart';
import 'package:sunday_ui/CoreComponents/sunday_appbar/sunday_appbar.dart';

/// A Cupertino-style scaffold for the Sunday UI framework.
///
/// This widget provides a basic structure for Cupertino-style pages, including
/// support for a navigation bar, background color, and content resizing to avoid
/// the bottom inset (e.g., keyboard).
class SundayCupertinoScaffold extends StatelessWidget {
  /// Creates a [SundayCupertinoScaffold].
  ///
  /// The [child] and [resizeToAvoidBottomInset] parameters are required.
  const SundayCupertinoScaffold({
    super.key,
    this.navigationBar,
    required this.child,
    required this.resizeToAvoidBottomInset,
    this.backgroundColor,
  });

  /// The navigation bar to display at the top of the scaffold.
  ///
  /// This can be either an [ObstructingPreferredSizeWidget] or a [SundayAppBar].
  final dynamic navigationBar;

  /// The primary content of the scaffold.
  ///
  /// Typically a [Widget] that fills the remaining space after the [navigationBar].
  final Widget child;

  /// Whether the [child] should resize when the keyboard appears.
  ///
  /// If true, the body and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  final bool resizeToAvoidBottomInset;

  /// The color of the scaffold's background.
  ///
  /// By default, the color is set to [CupertinoTheme]'s `scaffoldBackgroundColor`.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: _buildCupertinoNavigationBar(),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      child: child,
    );
  }

  ObstructingPreferredSizeWidget? _buildCupertinoNavigationBar() {
    if (navigationBar == null) {
      return null;
    }

    if (navigationBar is ObstructingPreferredSizeWidget) {
      return navigationBar as ObstructingPreferredSizeWidget;
    }

    if (navigationBar is SundayAppBar) {
      final SundayAppBar sundayAppBar = navigationBar as SundayAppBar;
      return CupertinoNavigationBar(
        middle: sundayAppBar.middle,
        leading: sundayAppBar.leading,
        trailing: sundayAppBar.actions != null
            ? Row(mainAxisSize: MainAxisSize.min, children: sundayAppBar.actions!)
            : null,
        backgroundColor: sundayAppBar.backgroundColor,
        // Add other properties as needed
      );
    }

    throw ArgumentError('navigationBar must be either ObstructingPreferredSizeWidget or SundayAppBar');
  }
}
