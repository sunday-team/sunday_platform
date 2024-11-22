import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:sunday_ui/MainComponents/sunday_layout/sidebar_layout/group.dart';
import 'package:sunday_ui/MainComponents/sunday_layout/sidebar_layout/item.dart';
import 'package:sunday_ui/MainComponents/sunday_layout/sidebar_layout/view.dart';
import 'package:sunday_ui/MainComponents/sunday_layout/sunday_layout.dart';
import 'package:sunday_ui/sunday_ui.dart';
import 'package:sunday_ui_library/theme_data.dart';

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
      home: MyHomePage(
        currentStyle: _currentStyle,
        onStyleToggle: _toggleStyle,
      ),
      title: "Style Switcher Demo",
      uiStyle: _currentStyle,
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
        children: [
          SideBarItemGroup(
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
