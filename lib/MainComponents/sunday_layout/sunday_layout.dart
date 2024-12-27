import 'package:flutter/material.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/classes.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar/sunday_sidebar.dart';
import 'package:sunday_platform/sunday_platform.dart';

/// A widget that represents the main layout for the Sunday UI, adapting
/// to different screen sizes and layout styles.
class SundayLayout extends StatefulWidget {
  /// Creates a [SundayLayout] widget.
  ///
  /// The [style], [desktopLayoutStyle], and [mobileLayoutStyle] parameters
  /// must not be null.
  const SundayLayout({
    super.key,
    required this.style,
    required this.desktopLayoutStyle,
    required this.mobileLayoutStyle,
    required this.mainView,
  });

  /// The style to be applied to the layout.
  final Style style;

  /// The layout style to be used on desktop screens.
  final dynamic desktopLayoutStyle;

  /// The layout style to be used on mobile screens.
  final dynamic mobileLayoutStyle;

  /// The main view of the layout.
  final Widget mainView;

  @override
  State<SundayLayout> createState() => _SundayLayoutState();
}

class _SundayLayoutState extends State<SundayLayout> {
  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.width > 768;

    switch (widget.desktopLayoutStyle.runtimeType) {
      case const (SundayBottomBar):
        return SundayScaffold(
          style: widget.style,
          child: widget.mobileLayoutStyle,
        );
      case const (SundaySidebarView):
        return SundayScaffold(
          style: widget.style,
          child: isMobile
              ? Row(
                  children: [
                    SideBarLayout(
                      style: widget.style,
                      keyCollapsed: widget.desktopLayoutStyle.keyCollapsed,
                      itemTextColor: widget.desktopLayoutStyle.itemTextColor,
                      darkItemTextColor:
                          widget.desktopLayoutStyle.darkItemTextColor,
                      titleColor: widget.desktopLayoutStyle.titleColor,
                      backgroundColor:
                          widget.desktopLayoutStyle.backgroundColor,
                      title: widget.desktopLayoutStyle.title,
                      children: widget.desktopLayoutStyle.children,
                      itemBackgroundColor:
                          widget.desktopLayoutStyle.itemBackgroundColor,
                      darkItemBackgroundColor:
                          widget.desktopLayoutStyle.darkItemBackgroundColor,
                    ),
                    Expanded(child: widget.mainView),
                  ],
                )
              : widget.mobileLayoutStyle,
        );
      case const (SplitViewSideBarRight):
        return SundayScaffold(
          style: widget.style,
          child: Row(
            children: [
              widget.desktopLayoutStyle.leftView,
              SundayBottomBar(
                items: widget.desktopLayoutStyle.items,
                currentIndex: widget.desktopLayoutStyle.bottomBarIndex,
                onTap: widget.desktopLayoutStyle.onBottomBarTap,
                style: widget.style,
                tabBuilder: widget.desktopLayoutStyle.tabBuilder,
              ),
            ],
          ),
        );
      default:
        return SundayScaffold(style: widget.style, child: const Placeholder());
    }
  }
}
