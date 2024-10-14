import 'package:flutter/cupertino.dart';

/// A Cupertino-style bottom navigation bar with a tab scaffold.
///
/// This widget displays a bottom navigation bar with a list of items and uses
/// a CupertinoTabScaffold to manage the content of each tab. It allows
/// users to switch between different views in the application.
///
/// The [items] parameter is a list of BottomNavigationBarItems that represent the navigation items.
/// The [currentIndex] parameter indicates the currently selected item, and the
/// [onTap] callback is triggered when an item is tapped.
class SundayCupertinoBottomBar extends StatelessWidget {
  /// Creates a [SundayCupertinoBottomBar].
  ///
  /// The [items], [currentIndex], [onTap], and [tabBuilder] parameters must not be null.
  const SundayCupertinoBottomBar({
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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: items,
        currentIndex: currentIndex,
        onTap: onTap,
      ),
      tabBuilder: tabBuilder,
    );
  }
}
