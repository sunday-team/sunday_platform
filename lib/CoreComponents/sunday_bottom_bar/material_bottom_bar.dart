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
    return Scaffold(
      body: tabBuilder(context, currentIndex),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          // Assuming you have a state variable named currentPageIndex
          onTap(index);
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.notifications_sharp)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
