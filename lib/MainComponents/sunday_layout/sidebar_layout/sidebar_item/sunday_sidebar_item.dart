import 'package:flutter/material.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar_item/cupertino_sidebar_item.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar_item/macos_sidebar_item.dart';
import 'package:sunday_platform/style.dart';

/// A customizable sidebar item that adapts to different UI styles (Material, Cupertino, etc.).
class SundaySidebarItem extends StatelessWidget {
  /// The UI style to be used for the sidebar item.
  final Style style;

  /// The icon to display in the sidebar item.
  final Widget icon;

  /// The text to display in the sidebar item.
  final String text;

  /// The currently selected index.
  final String selectedIndex;

  /// The key index for this sidebar item.
  final String keyIndex;

  /// Callback function when the sidebar item is tapped.
  final VoidCallback onTap;

  /// The color of the text of the sidebar layout.
  final Color itemTextColor;

  /// The color of the text of the sidebar layout in dark mode.
  final Color darkItemTextColor;

  /// The color of the background of the item.
  final Color itemBackgroundColor;

  /// The color of the background of the item in dark mode.
  final Color darkItemBackgroundColor;

  /// Creates a sidebar item with the specified style and properties.
  const SundaySidebarItem({
    super.key,
    required this.style,
    required this.icon,
    required this.text,
    required this.selectedIndex,
    required this.keyIndex,
    required this.onTap,
    this.itemTextColor = Colors.black,
    this.darkItemTextColor = Colors.white,
    this.itemBackgroundColor = const Color(0xffDFDEE5),
    this.darkItemBackgroundColor = const Color(0xff39383D),
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.material:
      case Style.cupertino:
      case Style.fluent:
      case Style.latestIOS:
        return SundayCupertinoSidebarItem(
          onTap: onTap,
          icon: icon,
          text: text,
          keyIndex: keyIndex,
          selectedIndex: selectedIndex,
          itemTextColor: itemTextColor,
          darkItemTextColor: darkItemTextColor,
          itemBackgroundColor: itemBackgroundColor,
          darkItemBackgroundColor: darkItemBackgroundColor,
        );
      case Style.macos:
        return SundayMacOSSidebarItem(
          onTap: onTap,
          icon: icon,
          text: text,
          keyIndex: keyIndex,
          selectedIndex: selectedIndex,
          itemTextColor: itemTextColor,
          darkItemTextColor: darkItemTextColor,
          itemBackgroundColor: itemBackgroundColor,
          darkItemBackgroundColor: darkItemBackgroundColor,
        );
    }
  }
}
