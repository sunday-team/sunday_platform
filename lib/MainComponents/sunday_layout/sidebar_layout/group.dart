// Importing necessary packages for theme, Cupertino widgets, and custom components.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunday_core/Print/print.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar_item/sunday_sidebar_item.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/animate.dart';
import 'package:sunday_platform/style.dart';

/// A widget that groups multiple [SundaySidebarItem]s and provides functionality
/// to collapse or expand the group.
class SundaySideBarItemGroup extends StatefulWidget {
  /// A list of [SundaySidebarItem] widgets to be displayed in the group.
  final List<SundaySidebarItem> children;

  /// A boolean indicating whether the group is initially collapsed.
  final bool isCollapsed;

  /// A boolean indicating whether the group can be shown or hidden.
  final bool showAndHide;

  /// The title of the group, displayed at the top.
  final String title;

  /// The color of the text of the sidebar layout.
  final Color itemTextColor;

  /// The color of the text of the sidebar layout in dark mode.
  final Color darkItemTextColor;

  /// The color of the background of the item.
  final Color itemBackgroundColor;

  /// The color of the background of the item in dark mode.
  final Color darkItemBackgroundColor;

  /// The color of the text of the selected item.
  final Color selectedItemTextColor;

  /// The color of the text of the selected item in dark mode.
  final Color darkSelectedItemTextColor;

  /// Creates a [SideBarItemGroup].
  ///
  /// The [children] and [title] parameters must not be null.
  /// The [isCollapsed] and [showAndHide] parameters default to false.
  const SundaySideBarItemGroup(
      {super.key,
      required this.children,
      required this.isCollapsed,
      required this.showAndHide,
      required this.title,
      this.itemTextColor = Colors.black,
      this.darkItemTextColor = Colors.white,
      this.itemBackgroundColor = const Color(0xffDFDEE5),
      this.darkItemBackgroundColor = const Color(0xff39383D),
      this.selectedItemTextColor = Colors.black,
      this.darkSelectedItemTextColor = Colors.white});

  @override
  State<SundaySideBarItemGroup> createState() => _SundaySideBarItemGroupState();
}

/// State class for [SideBarItemGroup].
class _SundaySideBarItemGroupState extends State<SundaySideBarItemGroup> {
  late bool isCollapsed;

  @override
  void initState() {
    super.initState();
    isCollapsed = widget.isCollapsed;
  }

  @override
  void didUpdateWidget(SundaySideBarItemGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isCollapsed != widget.isCollapsed) {
      setState(() {
        isCollapsed = widget.isCollapsed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Retrieve the current theme from the context.
    return Column(
      children: <Widget>[
        /// If the group can be shown or hidden, display a header with a toggle.
        if (widget.showAndHide)
          GestureDetector(
            onTap: toggleCollapsed,
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 5, 30, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Display the title of the group.
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? widget.darkItemTextColor
                          : widget.itemTextColor,
                    ),
                  ),

                  /// Display an icon that rotates based on the collapsed state.
                  AnimatedRotation(
                    turns: isCollapsed ? 0.75 : 1,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(CupertinoIcons.chevron_down),
                  ),
                ],
              ),
            ),
          ),

        /// Add spacing between the header and the items.
        const SizedBox(height: 10),

        /// If the group can be shown or hidden, display the items with animation.
        if (widget.showAndHide)
          SidebarItemGroupAnimate(
            collapsed: isCollapsed,
            child: Column(
              children: [
                /// Map each child item to a [SidebarItem] widget.
                ...widget.children.map((item) {
                  return SundaySidebarItem(
                    itemBackgroundColor: widget.itemBackgroundColor,
                    darkItemBackgroundColor: widget.darkItemBackgroundColor,
                    itemTextColor: widget.itemTextColor,
                    darkItemTextColor: widget.darkItemTextColor,
                    keyIndex: item.keyIndex,
                    selectedIndex: item.selectedIndex,
                    onTap: item.onTap,
                    icon: item.icon,
                    text: item.text,
                  );
                })
              ],
            ),
          ),

        /// If the group cannot be shown or hidden, display the items directly.
        if (!widget.showAndHide)
          Column(
            children: [
              /// Map each child item to a [SidebarItem] widget.
              ...widget.children.map((item) {
                return SundaySidebarItem(
                  itemBackgroundColor: widget.itemBackgroundColor,
                  darkItemBackgroundColor: widget.darkItemBackgroundColor,
                  itemTextColor: widget.itemTextColor,
                  darkItemTextColor: widget.darkItemTextColor,
                  keyIndex: item.keyIndex,
                  selectedIndex: item.selectedIndex,
                  onTap: item.onTap,
                  icon: item.icon,
                  text: item.text,
                );
              })
            ],
          ),
      ],
    );
  }

  void toggleCollapsed() {
    setState(() {
      isCollapsed = !isCollapsed;
      sundayPrint("Toggled isCollapsed to: $isCollapsed");
    });
  }
}
