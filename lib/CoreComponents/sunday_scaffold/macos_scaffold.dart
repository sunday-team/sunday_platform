import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

/// A custom Scaffold widget for Sunday app.
///
/// This widget wraps the Macos [MacosScaffold] and provides a consistent structure
/// for pages in the Sunday app.
class SundayMacOSScaffold extends StatelessWidget {
  /// Creates a [SundayMacOSScaffold].
  ///
  const SundayMacOSScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
    this.appBar,
  });

  /// The primary content of the scaffold.
  ///
  /// Typically a [Widget] that represents the main content of the screen.
  final Widget? body;

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// The app bar to display at the top of the scaffold.
  final ToolBar? appBar;

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      backgroundColor: backgroundColor,
      toolBar: appBar,
      children: [
        ContentArea(builder: (context, scrollController) {
          return body ?? const SizedBox();
        }),
      ],
    );
  }
}
