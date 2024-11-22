// Importing the color theme provider package for theme management.
// Importing Cupertino widgets for iOS-style design.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunday_core/Print/print.dart';
import 'package:sunday_get_storage/sunday_get_storage.dart';
// Importing the sidebar item group widget.
import 'package:sunday_ui/MainComponents/sunday_layout/sidebar_layout/group.dart';
// Importing theme data for styling.

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
    required this.keyCollapsed,
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

  /// The key of the collapsed state.
  final String keyCollapsed;

  /// Creates the mutable state for this widget.
  @override
  State<SideBarLayout> createState() => _SideBarLayoutState();
}

/// The state class for SideBarLayout.
class _SideBarLayoutState extends State<SideBarLayout>
    with SingleTickerProviderStateMixin {
  /// An integer variable to track a tapped item, initialized to 1.
  var tappedOne = 1;

  /// A boolean variable to track the collapsed state of the sidebar.
  bool isCollapsed = false;

  /// Animation controller for the sidebar position
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  /// A Database for storing data about sidebar
  final box = GetStorage();

  /// Toggles the collapsed state of the sidebar.
  void toggleCollapsed() {
    setState(() {
      isCollapsed = !isCollapsed;
      if (isCollapsed) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  /// Initializes the state of the widget.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    box.listenKey("sidebar-layout-process-${widget.keyCollapsed}", (value) {
      sundayPrint("value: $value");
      if (value["action"] == "collapse") {
        if (value["whichIsTapped"] == "toogle-button") {
          toggleCollapsed();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds the widget tree for the sidebar layout.
  @override
  Widget build(BuildContext context) {
    /// Determine the current brightness to select appropriate colors.
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    // final iPadBackgroundColor =
    //     isDarkMode ? const Color(0xff1B1B1B) : const Color(0xffF1F1F5);
    final textColor =
        isDarkMode ? widget.darkItemTextColor : widget.itemTextColor;
    final dividerColor = isDarkMode
        ? const Color(0xff121212)
        : const Color.fromARGB(255, 181, 181, 181);

    /// Returns a sliding sidebar.
    return SizeTransition(
      sizeFactor: _slideAnimation,
      axis: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 350,
            child: CupertinoPageScaffold(
              backgroundColor: widget.backgroundColor,
              child: CustomScrollView(
                slivers: <Widget>[
                  CupertinoSliverNavigationBar(
                    leading: GestureDetector(
                      onTap: () {
                        var state = {
                          "isCollapsed": isCollapsed,
                          "whichIsTapped": "sidebar-layout-toogle-button",
                          "action": "collapse",
                        };
                        box.write(
                            "sidebar-layout-process-${widget.keyCollapsed}",
                            state);
                        toggleCollapsed();
                      },
                      child: const Icon(CupertinoIcons.sidebar_left),
                    ),
                    transitionBetweenRoutes: false,
                    border: null,
                    backgroundColor: widget.backgroundColor,
                    largeTitle: Text(
                      widget.title,
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: widget.children.asMap().entries.map((entry) {
                        final item = entry.value;
                        return SideBarItemGroup(
                          darkItemTextColor: widget.darkItemTextColor,
                          itemTextColor: widget.itemTextColor,
                          itemBackgroundColor: widget.itemBackgroundColor,
                          darkItemBackgroundColor:
                              widget.darkItemBackgroundColor,
                          title: item.title,
                          isCollapsed: isCollapsed,
                          showAndHide: item.showAndHide,
                          children: item.children,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 1,
            decoration: BoxDecoration(
              color: dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
