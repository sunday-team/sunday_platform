import 'package:flutter/cupertino.dart';
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
    this.padding,
    this.scrollController,
    required this.children,
    this.insetGrouped = true,
    this.showDividers = true,
    this.header,
    this.footer,
  });

  /// The style of the list view (Material or Cupertino).
  final Style style;

  /// The padding around the list view (for Material style).
  final EdgeInsetsGeometry? padding;

  /// The controller for the scroll view.
  final ScrollController? scrollController;

  /// Whether to use an inset grouped style (for Cupertino style).
  final bool insetGrouped;

  /// Whether to show dividers between list items.
  final bool showDividers;

  /// A header widget to display above the list.
  final String? header;

  /// A footer widget to display below the list.
  final Widget? footer;

  /// The list of widgets to display in the list view.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.material:
        return SundayMaterialListView(
          padding: padding,
          scrollController: scrollController,
          children: children,
        );
      case Style.cupertino:
        return SundayCupertinoListView(
          insetGrouped: insetGrouped,
          padding: padding ?? EdgeInsets.zero,
          scrollController: scrollController ?? ScrollController(),
          header: header != null ? SundayText(header!, style: style) : const SizedBox.shrink(),
          footer: footer ?? const SizedBox.shrink(),
          backgroundColor: CupertinoColors.systemGroupedBackground,
          dividerColor: showDividers
              ? CupertinoColors.separator
              : CupertinoColors.systemBackground,
          children: children,
        );
      case Style.custom:
      case Style.latestIOS:
        return SundayCupertinoListView(
          insetGrouped: insetGrouped,
          padding: padding ?? EdgeInsets.zero,
          scrollController: scrollController ?? ScrollController(),
          header: Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
            child: SundayText(
              header?.toUpperCase() ?? "",
              style: style,
              textStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          footer: footer ?? const SizedBox.shrink(),
          backgroundColor: CupertinoColors.systemGroupedBackground,
          dividerColor: showDividers
              ? CupertinoColors.separator
              : CupertinoColors.systemBackground,
          children: children,
        );
      default:
        throw UnimplementedError('Unsupported style: $style');
    }
  }
}
