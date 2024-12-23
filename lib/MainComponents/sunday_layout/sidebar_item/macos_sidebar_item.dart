import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

/// A custom sidebar item for Sunday MacOS that normalizes SidebarItem usage.
class SundayMacOSSidebarItem extends SidebarItem {
  /// Creates a normalized sidebar item with consistent styling and behavior.
  const SundayMacOSSidebarItem({
    required Widget labelText,
    Widget? leadingIcon,
    VoidCallback? onTap,
    super.selectedColor,
    super.unselectedColor,
    Widget? trailingWidget,
    super.shape,
  }) : super(
          label: labelText,
          leading: leadingIcon,
          trailing: trailingWidget,
        );
}
