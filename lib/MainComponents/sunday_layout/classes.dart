import 'package:flutter/widgets.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/item.dart';

/// Represents a navigation destination with a label, icon, and selected icon.
class NavDestination {
  /// Creates a navigation destination.
  const NavDestination(this.label, this.icon, this.selectedIcon);

  /// The label of the navigation destination.
  final String label;

  /// The icon of the navigation destination.
  final Widget icon;

  /// The icon displayed when the navigation destination is selected.
  final Widget selectedIcon;
}

/// Holds data for a sidebar item, including icon, text, and tap action.
class SidebarItemData {
  /// The icon of the sidebar item.
  final Widget icon;

  /// The text label of the sidebar item.
  final String text;

  /// The index of the selected item.
  final String selectedIndex;

  /// The key index of the sidebar item.
  final String keyIndex;

  /// The callback function to be executed on tap.
  final void Function() onTap;

  /// Creates a sidebar item data object.
  const SidebarItemData({
    required this.icon,
    required this.text,
    required this.selectedIndex,
    required this.keyIndex,
    required this.onTap,
  });
}

/// Represents a group of sidebar items with a title and collapse functionality.
class SidebarItemGroup {
  /// The list of sidebar items in the group.
  final List<SidebarItem> children;

  /// Indicates whether the group is collapsed.
  final bool isCollapsed;

  /// Indicates whether the group can be shown or hidden.
  final bool showAndHide;

  /// The title of the sidebar item group.
  final String title;

  /// Creates a sidebar item group.
  const SidebarItemGroup({
    required this.children,
    required this.isCollapsed,
    required this.showAndHide,
    required this.title,
  });
}

/// Enum representing the position of the sidebar.
enum SideBarPosition {
  /// Sidebar positioned on the left.
  left,

  /// Sidebar positioned on the right.
  right
}

/// Split View Layout with bottom bar at the bottom.
class SplitViewBottomBarBottom {
  /// The widget displayed on the right side of the split view.
  final Widget rightView;

  /// The index of the selected bottom bar item.
  final int bottomBarIndex;

  /// The callback function to be executed on bottom bar item tap.
  final void Function(int) onBottomBarTap;

  /// The builder for creating tabs.
  final dynamic tabBuilder;

  /// The list of navigation destinations for the bottom bar.
  final List<NavDestination> items;

  /// The width of the sidebar.
  final double sideBarWidth;

  /// The position of the sidebar.
  final SideBarPosition sidebarPosition;

  /// Creates a split view layout with a bottom bar.
  const SplitViewBottomBarBottom({
    required this.rightView,
    required this.bottomBarIndex,
    required this.onBottomBarTap,
    required this.tabBuilder,
    required this.items,
    this.sideBarWidth = 350,
    this.sidebarPosition = SideBarPosition.left,
  });
}

/// Split View Layout with a side bar at left.
class SplitViewSideBar {
  /// The widget displayed on the right side of the split view.
  final Widget rightView;

  /// The index of the selected sidebar item.
  final int sideBarIndex;

  /// The callback function to be executed on sidebar item tap.
  final void Function(int) onSideBarTap;

  /// The builder for creating tabs.
  final dynamic tabBuilder;

  /// The list of sidebar item groups.
  final List<SidebarItemGroup> items;

  /// The position of the sidebar.
  final SideBarPosition sidebarPosition;

  /// The title of the sidebar.
  final String title;

  /// Creates a split view layout with a sidebar on the left.
  const SplitViewSideBar({
    required this.rightView,
    required this.sideBarIndex,
    required this.onSideBarTap,
    required this.tabBuilder,
    required this.items,
    this.sidebarPosition = SideBarPosition.left,
    required this.title,
  });
}

/// Split View Layout with a side bar at right.
class SplitViewSideBarRight {
  /// The widget displayed on the left side of the split view.
  final Widget leftView;

  /// The widget displayed on the right side of the split view.
  final Widget rightView;

  /// The index of the selected sidebar item.
  final int sideBarIndex;

  /// The callback function to be executed on sidebar item tap.
  final void Function(int) onSideBarTap;

  /// The builder for creating tabs.
  final dynamic tabBuilder;

  /// The list of navigation destinations for the sidebar.
  final List<NavDestination> items;

  /// Creates a split view layout with a sidebar on the right.
  const SplitViewSideBarRight({
    required this.leftView,
    required this.rightView,
    required this.sideBarIndex,
    required this.onSideBarTap,
    required this.tabBuilder,
    required this.items,
  });
}

/// Builds a list of navigation destinations.
class DestinationBuilder {
  /// The label for the messages destination.
  final String messages;

  /// The label for the settings destination.
  final String settings;

  /// The icon for the messages destination.
  final Icon messagesIcon;

  /// The icon displayed when the messages destination is selected.
  final Icon messagesSelectedIcon;

  /// The icon for the settings destination.
  final Icon settingsIcon;

  /// The icon displayed when the settings destination is selected.
  final Icon settingsSelectedIcon;

  /// Creates a destination builder.
  const DestinationBuilder({
    required this.messages,
    required this.settings,
    required this.messagesIcon,
    required this.messagesSelectedIcon,
    required this.settingsIcon,
    required this.settingsSelectedIcon,
  });

  /// Builds and returns a list of navigation destinations.
  List<NavDestination> buildDestinations(BuildContext context) {
    return <NavDestination>[
      NavDestination(
        messages,
        messagesIcon,
        messagesSelectedIcon,
      ),
      NavDestination(
        settings,
        settingsIcon,
        settingsSelectedIcon,
      ),
    ];
  }
}
