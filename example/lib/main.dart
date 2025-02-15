import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar/sunday_sidebar.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar_item/sunday_sidebar_item.dart';
import 'package:sunday_platform/sunday_platform.dart';
import './theme_data.dart';

void main() {
  runApp(
    ColorThemeProvider(
      theme: LightMyTheme(),
      darkTheme: DarkMyTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Style currentStyle = Style.fluent;

  void _toggleStyle() {
    setState(() {
      currentStyle =
          currentStyle == Style.fluent ? Style.latestIOS : Style.fluent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SundayApp(
      home: SundayScaffold(
        style: currentStyle,
        child: MyHomePage(
          currentStyle: currentStyle,
          onStyleToggle: _toggleStyle,
        ),
      ),
      title: "Sunday Patform",
      uiStyle: currentStyle,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Style currentStyle;
  final VoidCallback onStyleToggle;

  const MyHomePage({
    super.key,
    required this.currentStyle,
    required this.onStyleToggle,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  String selectedIndex = "library";

  @override
  Widget build(BuildContext context) {
    return SundayLayout(
      style: widget.currentStyle,
      mobileLayoutStyle: SundayBottomBar(
        items: [
          SundayNavigationBarItem(
            icon: const Icon(CupertinoIcons.chat_bubble_2),
            label: "Messages",
            style: widget.currentStyle,
          ),
          SundayNavigationBarItem(
            icon: const Icon(CupertinoIcons.gear),
            label: "Settings",
            style: widget.currentStyle,
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
        style: widget.currentStyle,
        tabBuilder: (BuildContext context, int index) {
          return SundayScaffold(
            style: widget.currentStyle,
            child: Center(child: Text("Tab $index")),
          );
        },
      ),
      mainView: SundayScaffold(
        appBar: SundayAppBar(
          middle: Text("Sunday Platform App Bar", style: FluentTheme.of(context).typography.subtitle,),
          title: const Text("Sunday Platform AppBar"),
          style: widget.currentStyle,
          leading: const ToggleSidebarButton(
            keyCollapsed: 'desktop-sidebar-layout',
          ),
        ),
        style: widget.currentStyle,
        child: Center(
            child: SundayTextButton(
                onPressed: () {
                  widget.onStyleToggle();
                },
                style: widget.currentStyle,
                child: Text("Toogle Ui", style: FluentTheme.of(context).typography.body,))),
      ),
      desktopLayoutStyle: SundaySidebarView(
        style: widget.currentStyle,
        title: "Sunday Platform",
        keyCollapsed: "desktop-sidebar-layout",
        children: [
          SundaySideBarItemGroup(
            style: widget.currentStyle,
            isCollapsed: false,
            showAndHide: false,
            title: "Photo Library",
            children: [
              SundaySidebarItem(
                  style: widget.currentStyle,
                  keyIndex: "item1",
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = "item1";
                    });
                  },
                  icon: const Icon(CupertinoIcons.airplane),
                  text: "Sunday Sidebar Item 1"),
              SundaySidebarItem(
                  style: widget.currentStyle,
                  keyIndex: "item2",
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = "item2";
                    });
                  },
                  icon: const Icon(CupertinoIcons.photo_on_rectangle),
                  text: "Sunday Sidebar Item 2"),
            ],
          ),
        ],
      ),
    );
  }
}
