import 'package:flutter/cupertino.dart';

/// A Cupertino-style grouped section list view for the Sunday UI package.
class SundayCupertinoListView extends StatelessWidget {
  /// Creates a [SundayCupertinoListView].
  const SundayCupertinoListView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.insetGrouped,
    required this.padding,
    required this.scrollController,
    required this.header,
    required this.footer,
    required this.backgroundColor,
    required this.dividerColor,
    required this.separatorBuilder,
  });

  /// A function that builds list items.
  final Widget Function(BuildContext, int) itemBuilder;

  /// The number of items in the list view.
  final int itemCount;

  /// Whether to use an inset grouped style.
  final bool insetGrouped;

  /// The padding around the list view.
  final EdgeInsetsGeometry padding;

  /// The controller for the scroll view.
  final ScrollController scrollController;

  /// A header widget to display above the list.
  final Widget header;

  /// A footer widget to display below the list.
  final Widget footer;

  /// The background color of the list section.
  final Color backgroundColor;

  /// The color of the dividers between items.
  final Color dividerColor;

  /// A function that builds separators between items.
  final Widget Function(BuildContext, int) separatorBuilder;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = List.generate(
      itemCount,
      (index) => itemBuilder(context, index),
    );

    final listSection = insetGrouped 
        ? CupertinoListSection.insetGrouped(
            header: header,
            footer: footer,
            backgroundColor: backgroundColor,
            children: children,
          )
        : CupertinoListSection(
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
