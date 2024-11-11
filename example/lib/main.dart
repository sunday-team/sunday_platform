import 'package:flutter/cupertino.dart';
import 'package:sunday_ui/sunday_ui.dart';
import 'package:color_theme_provider/color_theme_provider.dart';
import "./theme_data.dart";

void main() {
  runApp(const MyApp());
}

class NavDestination {
  const NavDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
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

  @override
  Widget build(BuildContext context) {
    return SundayLayout(
      style: widget.currentStyle,
      layoutStyle: SplitViewBottomBarBottom(
        rightView: SundayScaffold(
          style: widget.currentStyle,
          child: Center(child: Text("Tab $currentIndex")),
        ),
        bottomBarIndex: currentIndex,
        onBottomBarTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        tabBuilder: (BuildContext context, int index) {
          return SundayScaffold(
            style: widget.currentStyle,
            child: Center(child: Text("Tab $index")),
          );
        },
        items: [
          const NavDestination(
            "Messages",
            Icon(CupertinoIcons.chat_bubble_2),
            Icon(CupertinoIcons.chat_bubble_2_fill),
          ),
          const NavDestination(
            "Settings",
            Icon(CupertinoIcons.gear),
            Icon(CupertinoIcons.gear_solid),
          ),
        ],
      ),
    );
    // return SundayBottomBar(
    //   style: widget.currentStyle,
    //   items: <SundayNavigationBarItem>[
    //     SundayNavigationBarItem(
    //       icon: Icon(widget.currentStyle == Style.material
    //           ? Icons.star
    //           : CupertinoIcons.star_fill),
    //       label: 'Favorites',
    //       style: widget.currentStyle,
    //     ),
    //     SundayNavigationBarItem(
    //       icon: const Icon(CupertinoIcons.clock_solid),
    //       label: 'Recents',
    //       style: widget.currentStyle,
    //     ),
    //     SundayNavigationBarItem(
    //       icon: const Icon(CupertinoIcons.person_alt_circle_fill),
    //       label: 'Contacts',
    //       style: widget.currentStyle,
    //     ),
    //     SundayNavigationBarItem(
    //       icon: const Icon(CupertinoIcons.circle_grid_3x3_fill),
    //       label: 'Keypad',
    //       style: widget.currentStyle,
    //     ),
    //   ],
    //   currentIndex: currentIndex,
    //   onTap: (index) {
    //     sundayPrint("Tapped on item $index");
    //     setState(() {
    //       currentIndex = index;
    //       sundayPrint("currentIndex: $currentIndex");
    //     });
    //   },
    //   tabBuilder: (BuildContext context, int index) {
    //     return Center(
    //       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //         SundayTextButton(
    //           onPressed: widget.onStyleToggle,
    //           style: widget.currentStyle,
    //           child: const Text("Toggle Style"),
    //         ),
    //         const SizedBox(height: 20),
    //         Text("Tab $index"),
    //         SundayTextField(
    //           style: widget.currentStyle,
    //           placeholder: "Enter text",
    //         ),
    //         Expanded(
    //             child: SafeArea(
    //           child: SundayListView(
    //             style: widget.currentStyle,
    //             header: "Headers",
    //             children: [
    //               SundayListTile(
    //                 leading: Container(
    //                   width: 50,
    //                   height: 50,
    //                   color: CupertinoColors.activeGreen,
    //                 ),
    //                 style: widget.currentStyle,
    //                 title: SundayText("Title", style: widget.currentStyle),
    //                 subtitle:
    //                     SundayText("Subtitle", style: widget.currentStyle),
    //                 trailing:
    //                     SundayText("Trailing", style: widget.currentStyle),
    //               ),
    //             ],
    //           ),
    //         ))
    //       ]),
    //     );
    //   },
    // );
  }
}

class SidebarItemGroupAnimate extends StatefulWidget {
  const SidebarItemGroupAnimate({
    super.key,
    required this.child,
    this.collapsed = false,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  final Widget child;
  final bool collapsed;
  final Duration animationDuration;

  @override
  _SidebarItemGroupAnimateState createState() =>
      _SidebarItemGroupAnimateState();
}

class _SidebarItemGroupAnimateState extends State<SidebarItemGroupAnimate> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: widget.animationDuration,
      tween: Tween<double>(
          begin: widget.collapsed ? 1.0 : 0.0,
          end: widget.collapsed ? 0.0 : 1.0),
      builder: (BuildContext context, double value, Widget? child) {
        return AnimatedContainer(
          duration: widget.animationDuration,
          height: value == 0 ? 0 : null,
          child: ClipRect(
            child: Transform.translate(
              offset: Offset(0, (1 - value) * -200),
              child: Align(
                heightFactor: value,
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: value,
                  child: SizedBox(
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}

// SidebarMultiView

class SidebarMultiView extends StatefulWidget {
  const SidebarMultiView({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<SidebarItemGroup> children;

  @override
  State<SidebarMultiView> createState() => _SidebarMultiViewState();
}

class _SidebarMultiViewState extends State<SidebarMultiView> {
  var tappedOne = 1;
  bool isCollapsed = false;

  void toggleCollapsed() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.colorTheme<MyTheme>();
    return Row(
      children: [
        Expanded(
          child: CupertinoPageScaffold(
            backgroundColor: theme.iPadBackground,
            child: CustomScrollView(
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  transitionBetweenRoutes: false,
                  border: null,
                  backgroundColor: theme.iPadBackground,
                  leading: GestureDetector(
                    onTap: () {},
                    child: const Icon(CupertinoIcons.sidebar_left, weight: 1),
                  ),
                  largeTitle: Text(
                    widget.title,
                    style: TextStyle(color: theme.textColor),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                      children: widget.children.asMap().entries.map((entry) {
                    final item = entry.value;
                    return SideBarItemGroup(
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
        Container(
          width: 1,
          decoration: BoxDecoration(
            color: theme.dividerColor,
          ),
        )
      ],
    );
  }
}

class SidebarItemData {
  final Widget icon;
  final String text;
  final String selectedIndex;
  final String keyIndex;
  final void Function() onTap;

  const SidebarItemData({
    required this.icon,
    required this.text,
    required this.selectedIndex,
    required this.keyIndex,
    required this.onTap,
  });
}

class SidebarItem extends StatefulWidget {
  const SidebarItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.keyIndex,
    required this.selectedIndex,
  });

  final void Function() onTap;
  final Widget icon;
  final String text;
  final String keyIndex;
  final String selectedIndex;

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  @override
  Widget build(BuildContext context) {
    var theme = context.colorTheme<MyTheme>();
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        margin: const EdgeInsets.fromLTRB(20, 0, 30, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.selectedIndex == widget.keyIndex
              ? theme.itemColor
              : CupertinoColors.transparent,
        ),
        height: 45,
        child: Row(
          children: [
            widget.icon,
            const SizedBox(width: 10),
            Text(widget.text,
                style: TextStyle(
                    fontFamily: "SF Pro",
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: theme.textColor))
          ],
        ),
      ),
    );
  }
}

class SidebarItemGroup {
  final List<SidebarItem> children;
  final bool isCollapsed;
  final bool showAndHide;
  final String title;

  const SidebarItemGroup({
    required this.children,
    this.isCollapsed = false,
    required this.showAndHide,
    required this.title,
  });
}

class SideBarItemGroup extends StatefulWidget {
  final List<SidebarItem> children;
  final bool isCollapsed;
  final bool showAndHide;
  final String title;

  const SideBarItemGroup({
    super.key,
    required this.children,
    this.isCollapsed = false,
    this.showAndHide = false,
    required this.title,
  });

  @override
  State<SideBarItemGroup> createState() => _SideBarItemGroupState();
}

class _SideBarItemGroupState extends State<SideBarItemGroup> {
  bool isCollapsed = false;

  void toggleCollapsed() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.colorTheme<MyTheme>();
    return Column(
      children: <Widget>[
        if (widget.showAndHide)
          GestureDetector(
            onTap: toggleCollapsed,
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title, style: TextStyle(color: theme.textColor)),
                  AnimatedRotation(
                    turns: isCollapsed ? 0.75 : 1,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(CupertinoIcons.chevron_down),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 10),
        if (widget.showAndHide)
          SidebarItemGroupAnimate(
            collapsed: isCollapsed,
            child: Column(
              children: [
                ...widget.children.map((item) {
                  return SidebarItem(
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
        if (!widget.showAndHide)
          Column(
            children: [
              ...widget.children.map((item) {
                return SidebarItem(
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
}

enum SideBarPosition { left, right }

/// Split View Layout with bottom bar at the bottom.
class SplitViewBottomBarBottom {
  final Widget rightView;
  final int bottomBarIndex;
  final void Function(int) onBottomBarTap;
  final dynamic tabBuilder;
  final List<NavDestination> items;
  final double sideBarWidth;
  final SideBarPosition sidebarPosition;

  const SplitViewBottomBarBottom({
    required this.rightView,
    required this.bottomBarIndex,
    required this.onBottomBarTap,
    required this.tabBuilder,
    required this.items,
    this.sideBarWidth = 350,
    this.sidebarPosition = SideBarPosition.left,
  });
}

/// Split View Layout with a side bar at left.
class SplitViewSideBar {
  final Widget rightView;
  final int sideBarIndex;
  final void Function(int) onSideBarTap;
  final dynamic tabBuilder;
  final List<SidebarItemGroup> items;
  final SideBarPosition sidebarPosition;
  final String title;

  const SplitViewSideBar({
    required this.rightView,
    required this.sideBarIndex,
    required this.onSideBarTap,
    required this.tabBuilder,
    required this.items,
    this.sidebarPosition = SideBarPosition.left,
    required this.title,
  });
}

/// Split View Layout with a side bar at right.
class SplitViewSideBarRight {
  final Widget leftView;
  final Widget rightView;
  final int sideBarIndex;
  final void Function(int) onSideBarTap;
  final dynamic tabBuilder;
  final List<NavDestination> items;

  const SplitViewSideBarRight({
    required this.leftView,
    required this.rightView,
    required this.sideBarIndex,
    required this.onSideBarTap,
    required this.tabBuilder,
    required this.items,
  });
}

class DestinationBuilder {
  final String messages;
  final String settings;
  final Icon messagesIcon;
  final Icon messagesSelectedIcon;
  final Icon settingsIcon;
  final Icon settingsSelectedIcon;

  const DestinationBuilder({
    required this.messages,
    required this.settings,
    required this.messagesIcon,
    required this.messagesSelectedIcon,
    required this.settingsIcon,
    required this.settingsSelectedIcon,
  });

  List<NavDestination> buildDestinations(BuildContext context) {
    return <NavDestination>[
      NavDestination(
        messages,
        messagesIcon,
        messagesSelectedIcon,
      ),
      NavDestination(
        settings,
        settingsIcon,
        settingsSelectedIcon,
      ),
    ];
  }
}

class SundayLayout extends StatefulWidget {
  const SundayLayout(
      {super.key, required this.style, required this.layoutStyle});

  final Style style;
  final dynamic layoutStyle;

  @override
  State<SundayLayout> createState() => _SundayLayoutState();
}

class _SundayLayoutState extends State<SundayLayout> {
  Widget buildBottomBar() {
    return SundayBottomBar(
      items: widget.layoutStyle.items
          .map<SundayNavigationBarItem>(
              (destination) => SundayNavigationBarItem(
                    style: widget.style,
                    icon: destination.icon,
                    label: destination.label,
                  ))
          .toList(),
      currentIndex: widget.layoutStyle.bottomBarIndex,
      onTap: widget.layoutStyle.onBottomBarTap,
      style: widget.style,
      tabBuilder: widget.layoutStyle.tabBuilder,
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.layoutStyle.runtimeType) {
      case const (SplitViewBottomBarBottom):
        return SundayScaffold(
          style: widget.style,
          child: Row(
            children: [
              SizedBox(
                width: widget.layoutStyle.sideBarWidth,
                child: buildBottomBar(),
              ),
              Expanded(child: widget.layoutStyle.rightView),
            ],
          ),
        );
      case const (SplitViewSideBar):
        return SundayScaffold(
          style: widget.style,
          child: Row(
            children: [
              buildBottomBar(),
              widget.layoutStyle.rightView,
            ],
          ),
        );
      case SplitViewSideBarRight:
        return SundayScaffold(
          style: widget.style,
          child: Row(
            children: [
              widget.layoutStyle.leftView,
              buildBottomBar(),
            ],
          ),
        );
      default:
        return SundayScaffold(style: widget.style, child: const Placeholder());
    }
  }
}
