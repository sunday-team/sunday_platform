import 'package:flutter/material.dart';
import 'package:sunday_platform/MainComponents/sunday_list_header/material_list_header.dart';

/// A Material-style list view for the Sunday UI package.
class SundayMaterialListView extends StatelessWidget {
  /// Creates a [SundayMaterialListView].
  const SundayMaterialListView({
    super.key,
    required this.children,
    this.padding,
    this.scrollController,
    required this.header,
  });

  /// The list of widgets to display in the list view.
  final List<Widget> children;

  /// The padding around the list view.
  final EdgeInsetsGeometry? padding;

  /// The controller for the scroll view.
  final ScrollController? scrollController;

  /// A header widget to display above the list.
  final String header;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        children: [
          SundayMaterialListHeader(header: header), // Add the header here
          ...children,
        ],
      ),
    );
  }
}
