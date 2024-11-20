// Importing the color theme provider package for theme management.
import 'package:color_theme_provider/color_theme_provider.dart';
// Importing Cupertino widgets for iOS-style design.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Importing the sidebar item group widget.
import 'package:sunday_ui/MainComponents/sunday_layout/sidebar_layout/group.dart';
// Importing theme data for styling.
import 'package:sunday_ui/theme_data.dart';

/// A stateful widget representing the sidebar layout.
class SideBarLayout extends StatefulWidget {
  /// Constructor for SideBarLayout, requiring a title and children.
  const SideBarLayout({
    super.key,
    required this.title,
    required this.children,
    this.backgroundColor = const Color(0xffF1F1F5),
    this.titleColor = Colors.black,
    this.itemTextColor = Colors.black,
    this.darkTitleColor = Colors.white,
    this.darkItemTextColor = Colors.white,
    this.itemBackgroundColor = const Color(0xffDFDEE5),
    this.darkItemBackgroundColor = const Color(0xff39383D),
  });

  /// The title of the sidebar layout.
  final String title;

  /// A list of SidebarItemGroup widgets to be displayed.
  final List<SideBarItemGroup> children;

  /// The background color of the sidebar layout.
  final Color backgroundColor;

  /// The color of the title of the sidebar layout.
  final Color titleColor;

  /// The color of the text of the sidebar layout.
  final Color itemTextColor;

  /// The color of the title of the sidebar layout in dark mode.
  final Color darkTitleColor;

  /// The color of the text of the sidebar layout in dark mode.
  final Color darkItemTextColor;

  /// The color of the background of the item in dark mode.
  final Color darkItemBackgroundColor;

  /// The color of the background of the item.
  final Color itemBackgroundColor;

  /// Creates the mutable state for this widget.
  @override
  State<SideBarLayout> createState() => _SideBarLayoutState();
}

/// The state class for SideBarLayout.
class _SideBarLayoutState extends State<SideBarLayout> {
  /// An integer variable to track a tapped item, initialized to 1.
  var tappedOne = 1;

  /// A boolean variable to track the collapsed state of the sidebar.
  bool isCollapsed = false;

  /// Toggles the collapsed state of the sidebar.
  void toggleCollapsed() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  /// Initializes the state of the widget.
  @override
  void initState() {
    super.initState();
  }

  /// Builds the widget tree for the sidebar layout.
  @override
  Widget build(BuildContext context) {
    /// Determine the current brightness to select appropriate colors.
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final iPadBackgroundColor =
        isDarkMode ? const Color(0xff1B1B1B) : const Color(0xffF1F1F5);
    final textColor = isDarkMode ? widget.darkItemTextColor : widget.itemTextColor;
    final dividerColor = isDarkMode
        ? const Color(0xff121212)
        : const Color.fromARGB(255, 181, 181, 181);

    /// Returns a row containing the sidebar and a divider.
    return Row(
      mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
      children: [
        /// Uses Flexible instead of Expanded to allow for loose fitting.
        Flexible(
          fit: FlexFit.loose, // Use FlexFit.loose for flexible children
          child: SizedBox(
            width: 350, // Provide a fixed width to avoid unbounded width
            child: CupertinoPageScaffold(
              /// Sets the background color of the page.
              backgroundColor: widget.backgroundColor,

              /// Uses a custom scroll view to display the sidebar content.
              child: CustomScrollView(
                slivers: <Widget>[
                  /// A navigation bar for the sidebar.
                  CupertinoSliverNavigationBar(
                    /// Disables transition animations between routes.
                    transitionBetweenRoutes: false,

                    /// Removes the border of the navigation bar.
                    border: null,

                    /// Sets the background color of the navigation bar.
                    backgroundColor: widget.backgroundColor,

                    /// A leading icon for the navigation bar.
                    leading: GestureDetector(
                      onTap: () {},
                      child: const Icon(CupertinoIcons.sidebar_left, weight: 1),
                    ),

                    /// Displays the large title of the sidebar.
                    largeTitle: Text(
                      widget.title,
                      style: TextStyle(color: textColor),
                    ),
                  ),

                  /// Adapts a box to the sliver layout.
                  SliverToBoxAdapter(
                    /// Displays a column of sidebar item groups.
                    child: Column(
                        children: widget.children.asMap().entries.map((entry) {
                      /// Retrieves each sidebar item group.
                      final item = entry.value;

                      /// Returns a SideBarItemGroup widget.
                      return SideBarItemGroup(
                        darkItemTextColor: widget.darkItemTextColor,
                        itemTextColor: widget.itemTextColor,
                        itemBackgroundColor: widget.itemBackgroundColor,
                        darkItemBackgroundColor: widget.darkItemBackgroundColor,
                        title: item.title,
                        isCollapsed: item.isCollapsed,
                        showAndHide: item.showAndHide,
                        children: item.children,
                      );
                    }).toList()),
                  ),
                ],
              ),
            ),
          ),
        ),

        /// A container acting as a divider between the sidebar and other content.
        Container(
          /// Sets the width of the divider.
          width: 1,

          /// Sets the color of the divider.
          decoration: BoxDecoration(
            color: dividerColor,
          ),
        ),
      ],
    );
  }
}
