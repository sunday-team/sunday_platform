import 'package:flutter/material.dart';

/// A Material-style list view for the Sunday UI package.
class SundayMaterialListView extends StatelessWidget {
  /// Creates a [SundayMaterialListView].
  const SundayMaterialListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.separatorBuilder,
    this.padding,
    this.scrollController,
  });

  /// The number of items in the list.
  final int itemCount;

  /// A function that builds list items.
  final Widget Function(BuildContext, int) itemBuilder;

  /// A function that builds separators between list items (optional).
  final Widget Function(BuildContext, int)? separatorBuilder;

  /// The padding around the list view.
  final EdgeInsetsGeometry? padding;

  /// The controller for the scroll view.
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return separatorBuilder != null
        ? ListView.separated(
            itemCount: itemCount,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder!,
            padding: padding,
            controller: scrollController,
          )
        : ListView.builder(
            itemCount: itemCount,
            itemBuilder: itemBuilder,
            padding: padding,
            controller: scrollController,
          );
  }
}

