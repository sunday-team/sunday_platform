import 'package:flutter/material.dart';

/// A custom Scaffold widget for Sunday app.
///
/// This widget wraps the Material [Scaffold] and provides a consistent structure
/// for pages in the Sunday app.
class SundayMaterialScaffold extends StatelessWidget {
  /// Creates a [SundayMaterialScaffold].
  ///
  /// The [appBar], [body], and [resizeToAvoidBottomInset] parameters must not be null.
  const SundayMaterialScaffold({
    super.key,
    required this.appBar,
    required this.body,
    required this.resizeToAvoidBottomInset,
  });

  /// The app bar to display at the top of the scaffold.
  ///
  /// This can be any widget, typically an [AppBar].
  final dynamic appBar;

  /// The primary content of the scaffold.
  ///
  /// Typically a [Widget] that represents the main content of the screen.
  final Widget? body;

  /// Whether the body should resize when the keyboard appears.
  ///
  /// If true, the body will be resized when the keyboard is shown to avoid
  /// overlapping. If false, the body will not resize and may be partially
  /// obscured by the keyboard.
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}