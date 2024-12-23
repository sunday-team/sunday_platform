import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  Style _currentStyle = Style.latestIOS;

  void _toggleStyle() {
    setState(() {
      _currentStyle =
          _currentStyle == Style.material ? Style.latestIOS : Style.material;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SundayApp(
      home: SundayScaffold(
        backgroundColor: Colors.white,
        appBar: const SundayAppBar(
          middle: Text("Helloa"),
          style: Style.macos,
          leading: Text("Hellaoa"),
          allowWallpaperTintingOverrides: true,
          enableBlur: true,
        ),
        style: Style.macos,
        child: MyHomePage(
          currentStyle: _currentStyle,
          onStyleToggle: _toggleStyle,
        ),
      ),
      title: "Sunday Patform",
      uiStyle: Style.macos,
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
        style: widget.currentStyle,
        child: Center(child: Text("Tab $selectedIndex")),
      ),
      desktopLayoutStyle: SideBarLayout(
        title: "Title",
        keyCollapsed: "desktop-sidebar-layout",
        children: [
          SideBarItemGroup(
            isCollapsed: false,
            showAndHide: false,
            title: "Photo Library",
            children: [
              SidebarItem(
                  keyIndex: "library",
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = "library";
                    });
                  },
                  icon: const Icon(CupertinoIcons.photo_on_rectangle),
                  text: "Photo Library"),
              SidebarItem(
                  keyIndex: "liked",
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = "liked";
                    });
                  },
                  icon: const Icon(CupertinoIcons.heart),
                  text: "Liked Photos"),
              SidebarItem(
                  keyIndex: "recent",
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = "recent";
                    });
                  },
                  icon: const Icon(CupertinoIcons.clock),
                  text: "Recent"),
            ],
          ),
          SideBarItemGroup(
            isCollapsed: false,
            showAndHide: true,
            title: "Albums",
            children: [
              SidebarItem(
                  keyIndex: "albums",
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = "albums";
                    });
                  },
                  icon: const Icon(CupertinoIcons.square_stack),
                  text: "Albums"),
              SidebarItem(
                  keyIndex: "4",
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = "4";
                    });
                  },
                  icon: const Icon(CupertinoIcons.heart),
                  text: "Liked Photos"),
              SidebarItem(
                  keyIndex: "5",
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = "5";
                    });
                  },
                  icon: const Icon(CupertinoIcons.heart),
                  text: "Liked Photos"),
            ],
          )
        ],
      ),
    );
  }
}
