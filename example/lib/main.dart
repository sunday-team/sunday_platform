import 'package:flutter/cupertino.dart';
import 'package:sunday_core/Print/print.dart';
import 'package:sunday_ui/CoreComponents/sunday_app/sunday_app.dart';
import 'package:sunday_ui/CoreComponents/sunday_bottom_bar/sunday_bottom_bar.dart';
import 'package:sunday_ui/CoreComponents/sunday_navigationbar_item/sunday_navigationbar_item.dart';
import 'package:sunday_ui/style.dart';

void main() {
  runApp(const MyApp());
}

const style = Style.material;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SundayApp(
      home: MyHomePage(),
      title: "hey he hey",
      uiStyle: style,
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return SundayBottomBar(
      style: style,
      items: const <SundayNavigationBarItem>[
        SundayNavigationBarItem(
          icon: Icon(CupertinoIcons.star_fill),
          label: 'Favorites',
          style: style,
        ),
        SundayNavigationBarItem(
          icon: Icon(CupertinoIcons.clock_solid),
          label: 'Recents',
          style: style,
        ),
        SundayNavigationBarItem(
          icon: Icon(CupertinoIcons.person_alt_circle_fill),
          label: 'Contacts',
          style: style,
        ),
        SundayNavigationBarItem(
          icon: Icon(CupertinoIcons.circle_grid_3x3_fill),
          label: 'Keypad',
          style: style,
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
          child: Text("Tab $index"),
        );
      },
    );
  }
}
