import 'package:flutter/cupertino.dart';

/// A Cupertino-style grouped section list view for the Sunday UI package.
class SundayCupertinoListView extends StatelessWidget {
  /// Creates a [SundayCupertinoListView].
  const SundayCupertinoListView({
    super.key,
    required this.insetGrouped,
    required this.padding,
    this.scrollController,
    required this.header,
    required this.footer,
    required this.backgroundColor,
    required this.dividerColor,
    required this.children,
    this.margin,
  });

  /// Whether to use an inset grouped style.
  final bool insetGrouped;

  /// The padding around the list view.
  final EdgeInsetsGeometry? padding;

  /// The controller for the scroll view.
  final ScrollController? scrollController;

  /// A header widget to display above the list.
  final Widget? header;

  /// A footer widget to display below the list.
  final Widget? footer;

  /// The background color of the list section.
  final Color backgroundColor;

  /// The color of the dividers between items.
  final Color? dividerColor;

  /// The list of widgets to display in the list view.
  final List<Widget> children;

  /// The margin around the list view.
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final listSection = insetGrouped
        ? CupertinoListSection.insetGrouped(
            margin: margin ?? EdgeInsets.zero,
            header: header,
            footer: footer,
            backgroundColor: backgroundColor,
            children: children,
          )
        : CupertinoListSection(
            margin: margin ?? EdgeInsets.zero,
            header: header,
            footer: footer,
            backgroundColor: backgroundColor,
            children: children,
          );

    return SingleChildScrollView(
      controller: scrollController,
      padding: padding,
      child: listSection,
    );
  }
}
