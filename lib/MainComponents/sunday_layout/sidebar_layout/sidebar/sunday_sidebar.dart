import 'package:flutter/material.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/group.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar/cupertino_sidebar.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar/macos_sidebar.dart';
import 'package:sunday_platform/style.dart';

class SundaySidebarView extends StatelessWidget {
  final String title;
  final List<SundaySideBarItemGroup> children;
  final Color? backgroundColor;
  final Color titleColor;
  final Color itemTextColor;
  final Color darkTitleColor;
  final Color darkItemTextColor;
  final Color itemBackgroundColor;
  final Color darkItemBackgroundColor;
  final String keyCollapsed;
  final bool initialIsCollapsed;
  final Color selectedItemTextColor;
  final Color darkSelectedItemTextColor;
  final Style style;
  final bool? isMobile;

  const SundaySidebarView({
    super.key,
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
    required this.style,
    this.isMobile = false
  });

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.macos:
        return SundayMacOSSidebar(
          title: title,
          backgroundColor: backgroundColor,
          keyCollapsed: keyCollapsed,
          initialIsCollapsed: initialIsCollapsed,
          style: style,
          children: children,
        );
      case Style.yaru:
      case Style.cupertino:
      case Style.material:
      case Style.fluent:
      case Style.latestIOS:
        return SundayCupertinoSidebar(
          isMobile: isMobile,
          title: title,
          backgroundColor: backgroundColor,
          titleColor: titleColor,
          itemTextColor: itemTextColor,
          darkTitleColor: darkTitleColor,
          darkItemTextColor: darkItemTextColor,
          itemBackgroundColor: itemBackgroundColor,
          darkItemBackgroundColor: darkItemBackgroundColor,
          keyCollapsed: keyCollapsed,
          initialIsCollapsed: initialIsCollapsed,
          selectedItemTextColor: selectedItemTextColor,
          darkSelectedItemTextColor: darkSelectedItemTextColor,
          style: style,
          children: children,
        );
    }
  }
}
