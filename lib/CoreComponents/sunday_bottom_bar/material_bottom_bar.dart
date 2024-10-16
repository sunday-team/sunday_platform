import 'package:flutter/material.dart';
import 'package:sunday_ui/CoreComponents/sunday_navigationbar_item/sunday_navigationbar_item.dart';

/// A Material-style bottom navigation bar with a scaffold.
///
/// This widget provides a scaffold that includes a bottom navigation bar. It allows
/// users to switch between different views in the application.
///
/// The [items] parameter is a list of SundayBottomNavigationBarItems that represent the navigation items.
/// The [currentIndex] parameter indicates the currently selected item, and the
/// [onTap] callback is triggered when an item is tapped.
class SundayMaterialBottomBar extends StatelessWidget {
  /// Creates a [SundayMaterialBottomBar].
  ///
  /// The [items], [currentIndex], [onTap], and [tabBuilder] parameters must not be null.
  const SundayMaterialBottomBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    required this.tabBuilder,
  });

  /// The list of SundayBottomNavigationBarItems to display as navigation items.
  final List<SundayNavigationBarItem> items;

  /// The index of the currently selected item.
  final int currentIndex;

  /// Callback function that is called when an item is tapped.
  final ValueChanged<int> onTap;

  /// Builder function that creates the content for each tab.
  final IndexedWidgetBuilder tabBuilder;

  @override
  Widget build(BuildContext context) {
    // Map to convert SundayNavigationBarItem to NavigationDestination
    List<NavigationDestination> destinations = items.map((item) {
      return NavigationDestination(
        selectedIcon: item.icon,
        icon: item.icon, // Assuming the same icon is used for selected and unselected
        label: item.label ?? '', // Providing a default value for null labels
      );
    }).toList();

    return Scaffold(
      body: tabBuilder(context, currentIndex),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          onTap(index);
        },
        selectedIndex: currentIndex,
        destinations: destinations,
      ),
    );
  }
}
