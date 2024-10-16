import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' show Divider;
import 'package:sunday_ui/MainComponents/sunday_list_view/material_list_view.dart';
import 'package:sunday_ui/MainComponents/sunday_list_view/cupertino_list_view.dart';
import 'package:sunday_ui/MainComponents/sunday_text/sunday_text.dart';
import 'package:sunday_ui/style.dart';

/// A list view component for the Sunday UI package.
///
/// This widget adapts to the current style (Material or Cupertino) and renders
/// the appropriate list view implementation.
class SundayListView extends StatelessWidget {
  /// Creates a [SundayListView].
  const SundayListView({
    super.key,
    required this.style,
    required this.itemBuilder,
    this.padding,
    this.scrollController,
    required this.itemCount,
    this.insetGrouped = true,
    this.showDividers = true,
    this.header,
    this.footer,
  });

  /// The style of the list view (Material or Cupertino).
  final Style style;

  /// A function that builds list items (for both Material and Cupertino styles).
  final Widget Function(BuildContext, int) itemBuilder;

  /// The padding around the list view (for Material style).
  final EdgeInsetsGeometry? padding;

  /// The controller for the scroll view.
  final ScrollController? scrollController;

  /// Whether to use an inset grouped style (for Cupertino style).
  final bool insetGrouped;

  /// The number of items in the list view.
  final int itemCount;

  /// Whether to show dividers between list items.
  final bool showDividers;

  /// A header widget to display above the list.
  final String? header;

  /// A footer widget to display below the list.
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.material:
        return SundayMaterialListView(
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          separatorBuilder:
              showDividers ? (context, index) => const Divider() : null,
          padding: padding,
          scrollController: scrollController,
        );
      case Style.cupertino:
        return SundayCupertinoListView(
          insetGrouped: true,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          padding: padding ?? EdgeInsets.zero,
          scrollController: scrollController ?? ScrollController(),
          header: header != null ? SundayText(header!, style: style) : const SizedBox.shrink(),
          footer: footer ?? const SizedBox.shrink(),
          backgroundColor: CupertinoColors.systemGroupedBackground,
          dividerColor: showDividers
              ? CupertinoColors.activeBlue
              : CupertinoColors.systemRed,
          separatorBuilder: (context, index) =>
              showDividers ? const Divider() : const SizedBox.shrink(),
        );
      case Style.custom:
      case Style.latestIOS:
        return SundayCupertinoListView(
          insetGrouped: true,
          itemCount: itemCount,
          itemBuilder: itemBuilder,
          padding: padding ?? EdgeInsets.zero,
          scrollController: scrollController ?? ScrollController(),
          header: Padding(padding: const EdgeInsets.fromLTRB(14, 0, 0, 0), child: SundayText(header?.toUpperCase() ?? "", style: style, textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: CupertinoColors.systemGrey))),
          footer: footer ?? const SizedBox.shrink(),
          backgroundColor: CupertinoColors.systemGroupedBackground,
          dividerColor: showDividers
              ? CupertinoColors.activeBlue
              : CupertinoColors.systemRed,
          separatorBuilder: (context, index) =>
              showDividers ? const Divider() : const SizedBox.shrink(),
        );
      default:
        throw UnimplementedError('Unsupported style: $style');
    }
  }
}
