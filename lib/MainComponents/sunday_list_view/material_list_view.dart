import 'package:flutter/material.dart';

/// A Material-style list view for the Sunday UI package.
class SundayMaterialListView extends StatelessWidget {
  /// Creates a [SundayMaterialListView].
  const SundayMaterialListView({
    super.key,
    required this.children,
    this.padding,
    this.scrollController,
  });

  /// The list of widgets to display in the list view.
  final List<Widget> children;

  /// The padding around the list view.
  final EdgeInsetsGeometry? padding;

  /// The controller for the scroll view.
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      controller: scrollController,
      children: children,
    );
  }
}
