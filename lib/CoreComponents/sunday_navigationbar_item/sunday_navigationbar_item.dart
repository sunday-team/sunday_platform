import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sunday_ui/style.dart';

/// A custom bottom navigation bar item for Sunday UI that adapts based on the style.
///
/// This class represents an item in the bottom navigation bar, including its icon, label,
/// active icon, background color, and the style it should adhere to. It provides a method
/// to convert itself into a [BottomNavigationBarItem] based on the specified style.
class SundayNavigationBarItem {
  /// The icon displayed for the navigation item.
  final Widget icon;

  /// The label for the navigation item, displayed below the icon.
  final String? label;

  /// The icon displayed when the item is active.
  final Widget? activeIcon;

  /// The background color of the navigation item.
  final Color? backgroundColor;

  /// The style of the navigation item (Material, Cupertino, etc.).
  final Style style;

  /// Creates a [SundayNavigationBarItem].
  ///
  /// The [icon] and [style] parameters are required, while [label], [activeIcon],
  /// and [backgroundColor] are optional.
  const SundayNavigationBarItem({
    required this.icon,
    this.label,
    this.activeIcon,
    this.backgroundColor,
    required this.style,
  });

  /// Converts this item to a [BottomNavigationBarItem] based on the specified style.
  BottomNavigationBarItem toBottomNavigationBarItem() {
    switch (style) {
      case Style.material:
        return BottomNavigationBarItem(
          icon: icon,
          label: label,
          activeIcon: activeIcon,
          backgroundColor: backgroundColor,
        );
      case Style.cupertino:
      case Style.latestIOS:
        return BottomNavigationBarItem(
          icon: icon,
          label: label,
          activeIcon: activeIcon,
        );
      case Style.custom:
        // For custom style, you might want to implement your own logic
        return BottomNavigationBarItem(
          icon: icon,
          label: label,
          activeIcon: activeIcon,
          backgroundColor: backgroundColor,
        );
      default:
        throw UnimplementedError('Unsupported style: $style');
    }
  }
}
