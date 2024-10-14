import 'package:flutter/material.dart';
import 'package:sunday_ui/CoreComponents/sunday_bottom_bar/material_bottom_bar.dart';
import 'package:sunday_ui/CoreComponents/sunday_bottom_bar/cupertino_bottom_bar.dart';
import 'package:sunday_ui/CoreComponents/sunday_navigationbar_item/sunday_navigationbar_item.dart';
import 'package:sunday_ui/style.dart';

/// A customizable bottom navigation bar for the Sunday UI package.
///
/// This widget allows users to navigate between different sections of the app
/// using icons and labels. It can be customized with different styles (Material, Cupertino, etc.),
/// colors, and icon sizes.
class SundayBottomBar extends StatefulWidget {
  /// Creates a [SundayBottomBar] widget.
  ///
  /// The [items], [currentIndex], [onTap], [style], and [tabBuilder] parameters are required and should not be null.
  const SundayBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.style,
    required this.tabBuilder,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.iconSize,
    this.child,
  });

  /// The list of items to display in the bottom bar.
  final List<SundayNavigationBarItem> items;

  /// The index of the currently selected item.
  final int currentIndex;

  /// Callback function that is called when an item is tapped.
  final ValueChanged<int> onTap;

  /// The style of the bottom bar (Material, Cupertino, etc.).
  final Style style;

  /// Builder function that creates the content for each tab.
  final IndexedWidgetBuilder tabBuilder;

  /// The background color of the bottom bar.
  final Color? backgroundColor;

  /// The color of the selected item.
  final Color? selectedColor;

  /// The color of the unselected items.
  final Color? unselectedColor;

  /// The size of the icons in the bottom bar.
  final double? iconSize;

  /// The primary content of the scaffold.
  final Widget? child;

  @override
  _SundayBottomBarState createState() => _SundayBottomBarState();
}

class _SundayBottomBarState extends State<SundayBottomBar> {
  @override
  Widget build(BuildContext context) {
    switch (widget.style) {
      case Style.material:
        return SundayMaterialBottomBar(
          items: widget.items,
          currentIndex: widget.currentIndex,
          onTap: widget.onTap,
          tabBuilder: widget.tabBuilder,
        );
      case Style.cupertino:
      case Style.custom:
      case Style.latestIOS:
        return SundayCupertinoBottomBar(
          items: widget.items.map((item) => BottomNavigationBarItem(
            icon: item.icon,
            label: item.label,
          )).toList(),
          currentIndex: widget.currentIndex,
          onTap: widget.onTap,
          tabBuilder: widget.tabBuilder,
        );
      default:
        throw UnimplementedError('Unsupported style: ${widget.style}');
    }
  }
}
