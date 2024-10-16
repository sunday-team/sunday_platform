import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:sunday_core/Print/print.dart';
import 'package:sunday_ui/CoreComponents/sunday_app/sunday_app.dart';
import 'package:sunday_ui/CoreComponents/sunday_bottom_bar/sunday_bottom_bar.dart';
import 'package:sunday_ui/CoreComponents/sunday_navigationbar_item/sunday_navigationbar_item.dart';
import 'package:sunday_ui/MainComponents/sunday_list_tile/sunday_list_tile.dart';
import 'package:sunday_ui/MainComponents/sunday_list_view/sunday_list_view.dart';
import 'package:sunday_ui/MainComponents/sunday_text/sunday_text.dart';
import 'package:sunday_ui/MainComponents/sunday_text_button/sunday_text_button.dart';
import 'package:sunday_ui/MainComponents/sunday_text_field/sunday_text_field.dart';
import 'package:sunday_ui/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Style _currentStyle = Style.material;

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
    return SundayBottomBar(
      style: widget.currentStyle,
      items: <SundayNavigationBarItem>[
        SundayNavigationBarItem(
          icon: Icon(widget.currentStyle == Style.material
              ? Icons.star
              : CupertinoIcons.star_fill),
          label: 'Favorites',
          style: widget.currentStyle,
        ),
        SundayNavigationBarItem(
          icon: const Icon(CupertinoIcons.clock_solid),
          label: 'Recents',
          style: widget.currentStyle,
        ),
        SundayNavigationBarItem(
          icon: const Icon(CupertinoIcons.person_alt_circle_fill),
          label: 'Contacts',
          style: widget.currentStyle,
        ),
        SundayNavigationBarItem(
          icon: const Icon(CupertinoIcons.circle_grid_3x3_fill),
          label: 'Keypad',
          style: widget.currentStyle,
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        sundayPrint("Tapped on item $index");
        setState(() {
          currentIndex = index;
          sundayPrint("currentIndex: $currentIndex");
        });
      },
      tabBuilder: (BuildContext context, int index) {
        return Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SundayTextButton(
              onPressed: widget.onStyleToggle,
              style: widget.currentStyle,
              child: const Text("Toggle Style"),
            ),
            const SizedBox(height: 20),
            Text("Tab $index"),
            SundayTextField(
              style: widget.currentStyle,
              placeholder: "Enter text",
            ),
            Expanded(
                child: SafeArea(
              child: SundayListView(
                style: widget.currentStyle,
                header: "Headers",
                children: [
                  SundayListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      color: CupertinoColors.activeGreen,
                    ),
                    style: widget.currentStyle,
                    title: SundayText("Title", style: widget.currentStyle),
                    subtitle:
                        SundayText("Subtitle", style: widget.currentStyle),
                    trailing:
                        SundayText("Trailing", style: widget.currentStyle),
                  ),
                ],
              ),
            ))
          ]),
        );
      },
    );
  }
}
