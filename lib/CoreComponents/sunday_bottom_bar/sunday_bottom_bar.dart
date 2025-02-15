import 'package:flutter/material.dart';
import 'package:sunday_platform/CoreComponents/sunday_bottom_bar/material_bottom_bar.dart';
import 'package:sunday_platform/CoreComponents/sunday_bottom_bar/cupertino_bottom_bar.dart';
import 'package:sunday_platform/CoreComponents/sunday_navigationbar_item/sunday_navigationbar_item.dart';
import 'package:sunday_platform/style.dart';

/// A customizable bottom navigation bar for the Sunday UI package.
///
/// This widget allows users to navigate between different sections of the app
/// using icons and labels. It can be customized with different styles (Material, Cupertino, etc.),
/// colors, and icon sizes.
class SundayBottomBar extends StatefulWidget {
  /// Creates a [SundayBottomBar] widget.
  ///
  /// The [items], [currentIndex], [onTap], [style], [tabBuilder], and [height] parameters are required and should not be null.
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
  SundayBottomBarState createState() => SundayBottomBarState();
}

/// Builds the bottom navigation bar based on the style provided.
///
/// This method dynamically builds the bottom navigation bar based on the style
/// specified in the [SundayBottomBar] widget. It supports Material, Cupertino, and Custom styles.
class SundayBottomBarState extends State<SundayBottomBar> {
  @override
  Widget build(BuildContext context) {
    switch (widget.style) {
      case Style.material:
        return SundayMaterialBottomBar(
          items: widget.items
              .map((item) => BottomNavigationBarItem(
                    icon: item.icon,
                    label: item.label,
                  ))
              .toList(),
          currentIndex: widget.currentIndex,
          onTap: widget.onTap,
          tabBuilder: widget.tabBuilder,
        );
      case Style.cupertino:
      case Style.latestIOS:
        return SundayCupertinoBottomBar(
          items: widget.items
              .map((item) => BottomNavigationBarItem(
                    icon: item.icon,
                    label: item.label,
                  ))
              .toList(),
          currentIndex: widget.currentIndex,
          onTap: widget.onTap,
          tabBuilder: widget.tabBuilder,
        );
      default:
        throw UnimplementedError('Unsupported style: ${widget.style}');
    }
  }
}

// import 'package:flutter/material.dart';

// /// A Material-style bottom navigation bar with a scaffold.
// ///
// /// This widget provides a scaffold that includes a bottom navigation bar. It allows
// /// users to switch between different views in the application.
// ///
// /// The [items] parameter is a list of BottomNavigationBarItems that represent the navigation items.
// /// The [currentIndex] parameter indicates the currently selected item, and the
// /// [onTap] callback is triggered when an item is tapped.
// class SundayMaterialBottomBar extends StatelessWidget {
//   /// Creates a [SundayMaterialBottomBar].
//   ///
//   /// The [items], [currentIndex], [onTap], and [tabBuilder] parameters must not be null.
//   const SundayMaterialBottomBar({
//     super.key,
//     required this.items,
//     required this.currentIndex,
//     required this.onTap,
//     required this.tabBuilder,
//     required this.height, // Added height property
//   });

//   /// The list of BottomNavigationBarItems to display as navigation items.
//   final List<BottomNavigationBarItem> items;

//   /// The index of the currently selected item.
//   final int currentIndex;

//   /// Callback function that is called when an item is tapped.
//   final ValueChanged<int> onTap;

//   /// Builder function that creates the content for each tab.
//   final IndexedWidgetBuilder tabBuilder;

//   /// The height of the bottom navigation bar.
//   final double height; // Added height property

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: tabBuilder(context, currentIndex),
//       bottomNavigationBar: Container(
//         height: height,
//         child: CustomNavigationBar(
//           onTap: onTap,
//           currentIndex: currentIndex,
//           items: items,
//         ),
//       ),
//     );
//   }
// }

// /// A custom navigation bar widget.
// ///
// /// This widget is used in the [SundayMaterialBottomBar] to display the navigation items.
// /// It takes a list of [BottomNavigationBarItem]s, the current index, and a callback function
// /// that is triggered when an item is tapped.
// class CustomNavigationBar extends StatelessWidget {
//   /// The callback function that is called when an item is tapped.
//   final ValueChanged<int> onTap;

//   /// The index of the currently selected item.
//   final int currentIndex;

//   /// The list of BottomNavigationBarItems to display as navigation items.
//   final List<BottomNavigationBarItem> items;

//   /// Creates a [CustomNavigationBar].
//   ///
//   /// The [onTap], [currentIndex], and [items] parameters must not be null.
//   const CustomNavigationBar({
//     super.key,
//     required this.onTap,
//     required this.currentIndex,
//     required this.items,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Theme.of(context).colorScheme.surfaceContainer,
//       child: SafeArea(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(items.length, (index) {
//             final item = items[index];
//             final isSelected = index == currentIndex;
//             return Expanded(
//               child: GestureDetector(
//                 onTap: () => onTap(index),
//                 behavior: HitTestBehavior.opaque,
//                 child: Center(
//                   child: IconTheme(
//                     data: IconThemeData(
//                       color: isSelected
//                           ? Theme.of(context).colorScheme.primary
//                           : Theme.of(context).colorScheme.onSurface,
//                       size: 24,
//                     ),
//                     child: item.icon
//                   ),
//                 ),
//               ),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
