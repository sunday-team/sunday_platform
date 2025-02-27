// Importing the color theme provider package for theme management.
// Importing Cupertino widgets for iOS-style design.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunday_core/Print/print.dart';
import 'package:sunday_get_storage/sunday_get_storage.dart';
// Importing the sidebar item group widget.
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/group.dart';
// Importing theme data for styling.

/// A stateful widget representing the sidebar layout.
class SideBarLayout extends StatefulWidget {
  /// Constructor for SideBarLayout, requiring a title and children.
  const SideBarLayout(
      {super.key,
      required this.title,
      required this.children,
      this.backgroundColor,
      this.titleColor = Colors.black,
      this.itemTextColor = Colors.black,
      this.darkTitleColor = Colors.white,
      this.darkItemTextColor = Colors.white,
      this.itemBackgroundColor = const Color(0xffDFDEE5),
      this.darkItemBackgroundColor = const Color(0xff39383D),
      required this.keyCollapsed,
      this.initialIsCollapsed = false,
      this.selectedItemTextColor = Colors.black,
      this.darkSelectedItemTextColor = Colors.white,
      this.isMobile = false});

  /// The title of the sidebar layout.
  final String title;

  /// A list of SidebarItemGroup widgets to be displayed.
  final List<SundaySideBarItemGroup> children;

  /// The background color of the sidebar layout.
  final Color? backgroundColor;

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

  /// The initial collapsed state.
  final bool initialIsCollapsed;

  /// The color of the text of the selected item.
  final Color selectedItemTextColor;

  /// The color of the text of the selected item in dark mode.
  final Color darkSelectedItemTextColor;

  /// Does the sidebar has width or is expanded
  final bool? isMobile;

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
  late bool isCollapsed;

  /// Animation controller for the sidebar position
  late AnimationController _controller;
  late Animation<double> _slideAnimation;

  /// Storage listener disposal function
  Function? disposeListen;

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
    isCollapsed = widget.initialIsCollapsed;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutQuart, // Changed to a better curve
    ));

    // Initialize storage and set up listener
    _initStorage();
  }

  /// Initialize storage safely
  Future<void> _initStorage() async {
    try {
      await GetStorage.init();
      final box = GetStorage();

      // Store listener disposal function
      disposeListen = box
          .listenKey("sidebar-layout-process-${widget.keyCollapsed}", (value) {
        if (!mounted) return;

        sundayPrint("value: $value");
        if (value != null && value is Map) {
          if (value["action"] == "collapse") {
            if (value["whichIsTapped"] == "toogle-button") {
              toggleCollapsed();
            }
          }
        }
      });
    } catch (e) {
      sundayPrint("Error initializing storage: $e");
    }
  }

  @override
  void dispose() {
    // Clean up listeners to prevent memory leaks
    if (disposeListen != null) {
      disposeListen?.call();
    }
    _controller.dispose();
    super.dispose();
  }

  /// Safely write to storage
  Future<void> _writeToStorage(Map<String, dynamic> data) async {
    try {
      final box = GetStorage();
      await box.write("sidebar-layout-process-${widget.keyCollapsed}", data);
    } catch (e) {
      sundayPrint("Error writing to storage: $e");
    }
  }

  /// Builds the widget tree for the sidebar layout.
  @override
  Widget build(BuildContext context) {
    /// Determine the current brightness to select appropriate colors.
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final textColor =
        isDarkMode ? widget.darkItemTextColor : widget.itemTextColor;
    final dividerColor = isDarkMode
        ? const Color(0xff121212)
        : const Color.fromARGB(255, 181, 181, 181);
    final iPadBackgroundColor =
        isDarkMode ? const Color(0xff1B1B1B) : const Color(0xffF1F1F5);
    var backgroundColor = widget.backgroundColor ?? iPadBackgroundColor;

    /// Returns a sliding sidebar.
    return SizeTransition(
      sizeFactor: _slideAnimation,
      axis: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.isMobile == false 
              ? SizedBox(
                  width: 350,
                  child: CupertinoPageScaffold(
                    backgroundColor: backgroundColor,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        CupertinoSliverNavigationBar(
                          leading: GestureDetector(
                            onTap: () async {
                              final state = {
                                "isCollapsed": isCollapsed,
                                "whichIsTapped": "sidebar-layout-toogle-button",
                                "action": "collapse",
                              };
                              await _writeToStorage(state);
                              toggleCollapsed();
                            },
                            child: const Icon(CupertinoIcons.sidebar_left),
                          ),
                          transitionBetweenRoutes: false,
                          border: null,
                          backgroundColor: backgroundColor,
                          largeTitle: Text(
                            widget.title,
                            style: TextStyle(color: textColor),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: widget.children.asMap().entries.map((entry) {
                              final item = entry.value;
                              return SundaySideBarItemGroup(
                                selectedItemTextColor: widget.selectedItemTextColor,
                                darkSelectedItemTextColor:
                                    widget.darkSelectedItemTextColor,
                                darkItemTextColor: widget.darkItemTextColor,
                                itemTextColor: widget.itemTextColor,
                                itemBackgroundColor: widget.itemBackgroundColor,
                                darkItemBackgroundColor:
                                    widget.darkItemBackgroundColor,
                                title: item.title,
                                isCollapsed: item.isCollapsed,
                                showAndHide: item.showAndHide,
                                children: item.children,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ) 
              : Expanded(
                  child: CupertinoPageScaffold(
                    backgroundColor: backgroundColor,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        CupertinoSliverNavigationBar(
                          leading: GestureDetector(
                            onTap: () async {
                              final state = {
                                "isCollapsed": isCollapsed,
                                "whichIsTapped": "sidebar-layout-toogle-button",
                                "action": "collapse",
                              };
                              await _writeToStorage(state);
                              toggleCollapsed();
                            },
                            child: const Icon(CupertinoIcons.sidebar_left),
                          ),
                          transitionBetweenRoutes: false,
                          border: null,
                          backgroundColor: backgroundColor,
                          largeTitle: Text(
                            widget.title,
                            style: TextStyle(color: textColor),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: widget.children.asMap().entries.map((entry) {
                              final item = entry.value;
                              return SundaySideBarItemGroup(
                                selectedItemTextColor: widget.selectedItemTextColor,
                                darkSelectedItemTextColor:
                                    widget.darkSelectedItemTextColor,
                                darkItemTextColor: widget.darkItemTextColor,
                                itemTextColor: widget.itemTextColor,
                                itemBackgroundColor: widget.itemBackgroundColor,
                                darkItemBackgroundColor:
                                    widget.darkItemBackgroundColor,
                                title: item.title,
                                isCollapsed: item.isCollapsed,
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
