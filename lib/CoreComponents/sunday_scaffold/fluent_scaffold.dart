import 'package:fluent_ui/fluent_ui.dart';
import 'package:sunday_platform/CoreComponents/sunday_appbar/sunday_appbar.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/toogle_button.dart';

/// A custom scaffold that uses Fluent design principles.
///
/// This widget provides a structure for the app with a navigation view
/// and a content area, following the Fluent design guidelines.
class SundayFluentScaffold extends StatelessWidget {
  /// The content of the scaffold.
  final Widget child;

  final SundayAppBar? appbar;

  /// Creates a [SundayFluentScaffold].
  const SundayFluentScaffold({
    super.key,
    required this.child,
    this.appbar
  });

  @override
  Widget build(BuildContext context) {
    return FluentTheme(
      data: FluentThemeData(),
      child: NavigationView(
        appBar: appbar != null ?  NavigationAppBar(
          automaticallyImplyLeading: false,
          title: appbar?.middle ?? const SizedBox.shrink(),
          actions: appbar?.trailing ?? const SizedBox.shrink(),
          leading: appbar!.leading is SizedBox ? null : appbar!.leading,
        ) : null,
        content: child,
      ),
    );
  }
}