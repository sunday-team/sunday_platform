import 'package:flutter/material.dart';

/// A Material-style bottom navigation bar with a scaffold.
///
/// This widget provides a scaffold that includes a bottom navigation bar. It allows
/// users to switch between different views in the application.
///
/// The [items] parameter is a list of BottomNavigationBarItems that represent the navigation items.
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

  /// The list of BottomNavigationBarItems to display as navigation items.
  final List<BottomNavigationBarItem> items;

  /// The index of the currently selected item.
  final int currentIndex;

  /// Callback function that is called when an item is tapped.
  final ValueChanged<int> onTap;

  /// Builder function that creates the content for each tab.
  final IndexedWidgetBuilder tabBuilder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBuilder(context, currentIndex),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onTap,
        selectedIndex: currentIndex,
        destinations: items
            .map((item) => NavigationDestination(
                  selectedIcon: item.icon,
                  icon: item.icon,
                  label:
                      item.label ?? "", // Remove label if height is too small
                ))
            .toList(),
      ),
    );
  }
}
