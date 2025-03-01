import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:sunday_core/Print/print.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar/sunday_sidebar.dart';
import 'package:sunday_platform/MainComponents/sunday_layout/sidebar_layout/sidebar_item/sunday_sidebar_item.dart';
import 'package:sunday_platform/config/sunday_color_theme.dart';
import 'package:sunday_platform/sunday_config.dart';
import 'package:sunday_platform/sunday_platform.dart';
import 'package:sunday_platform_exemple/platform_style.dart';
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

  void _changeStyle(Style newStyle) {
    setState(() {
      currentStyle = newStyle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SundayConfigWidget(
      config: SundayConfig(uiStyle: PlatformStyle.current, colorTheme: SundayColorTheme()),
      child: SundayApp(
        home: SundayScaffold(
          child: MyHomePage(
            currentStyle: currentStyle,
            onStyleChange: _changeStyle,
          ),
        ),
        title: "Sunday Platform",
        uiStyle: currentStyle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Style currentStyle;
  final Function(Style) onStyleChange;

  const MyHomePage({
    super.key,
    required this.currentStyle,
    required this.onStyleChange,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  String selectedIndex = "library";

  // Helper method to get style name for display
  String getStyleName(Style style) {
    switch (style) {
      case Style.material:
        return 'Material';
      case Style.cupertino:
        return 'Cupertino';
      case Style.latestIOS:
        return 'Latest iOS';
      case Style.macos:
        return 'macOS';
      case Style.fluent:
        return 'Fluent';
      case Style.yaru:
        return 'Yaru';
    }
  }

  // Helper method to create a style button
  Widget styleButton(Style style) {
    bool isSelected = widget.currentStyle == style;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SundayTextButton(
        onPressed: () {
          widget.onStyleChange(style);
        },
        style: widget.currentStyle,
        child: SundayText(
          getStyleName(style),
          textStyle: isSelected 
              ? const TextStyle(fontWeight: FontWeight.bold) 
              : const TextStyle(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SundayLayout(
      style: PlatformStyle.current,
      mobileLayoutStyle: SundayBottomBar(
        items: [
          SundayNavigationBarItem(
            context: context,
            icon: const Icon(CupertinoIcons.chat_bubble_2),
            label: "Messages",
          ),
          SundayNavigationBarItem(
            icon: const Icon(CupertinoIcons.gear),
            label: "Settings",
            context: context,
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
         style: PlatformStyle.current,
        tabBuilder: (BuildContext context, int index) {
          return SundayScaffold(
            appBar: const SundayAppBar(
              middle: SundayText("Sunday Platform App Bar"),
              title: SundayText("Sunday Platform AppBar"),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SundayText("Current Style: ${getStyleName(widget.currentStyle)}"),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      styleButton(Style.material),
                      styleButton(Style.cupertino),
                      styleButton(Style.latestIOS),
                      styleButton(Style.macos),
                      styleButton(Style.fluent),
                      styleButton(Style.yaru),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      mainView: SundayScaffold(
        appBar: const SundayAppBar(
          middle: SundayText("Sunday Platform App Bar"),
          title: SundayText("Sunday Platform AppBar"),
          leading: ToggleSidebarButton(
            keyCollapsed: 'desktop-sidebar-layout',
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SundayText("Current Style: ${getStyleName(widget.currentStyle)}"),
              const SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  styleButton(Style.material),
                  styleButton(Style.cupertino),
                  styleButton(Style.latestIOS),
                  styleButton(Style.macos),
                  styleButton(Style.fluent),
                  styleButton(Style.yaru),
                ],
              ),
            ],
          ),
        ),
      ),
      desktopLayoutStyle: SundaySidebarView(
         style: PlatformStyle.current,
        title: "Sunday Platform",
        keyCollapsed: "desktop-sidebar-layout",
        children: [
          SundaySideBarItemGroup(
            isCollapsed: false,
            showAndHide: false,
            title: "Photo Library",
            children: [
              SundaySidebarItem(
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