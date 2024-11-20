import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class MyTheme implements ColorTheme {
  Color get mainColor;
  Color get secondaryColor;
  Color get destructiveColor;
  Color get backgroundColor;
  Color get textColor;
  Color get secondaryTextColor;
  Color get secondaryFadeTextColor;
  Color get fieldColor;
  Color get borderColor;
  Color get senderBubbleColor;
  Color get subtitleTextColor;
  Color get thirdFadeColor;
  Color get whiteColor;
  Color get blackColor;
  Color get dividerColor;
  Color get iPadBackground; // Added new color property
  Color get itemColor;
}

final class LightMyTheme implements MyTheme {
  @override
  final Color mainColor = const Color(0xFF7BD3EA);

  @override
  final Color backgroundColor = const Color(0xffF2F2F6);

  @override
  final Color textColor = Colors.black;

  @override
  final Color secondaryTextColor = Colors.white;

  @override
  final Color fieldColor = const Color(0xffF8F8F8);

  @override
  final Color borderColor = const Color(0xffD3D3D3);

  @override
  final Color senderBubbleColor = CupertinoColors.activeBlue;

  @override
  final Color secondaryFadeTextColor = const Color.fromARGB(255, 40, 39, 39);

  @override
  final Color subtitleTextColor = const Color.fromARGB(255, 105, 105, 105);

  @override
  final Color destructiveColor = const Color(0xffFF0000);

  @override
  final Color secondaryColor = const Color(0xffF8F8F8);

  @override
  final Color thirdFadeColor = const Color(0xffa0a0a6);

  @override
  final Color whiteColor = const Color(0xffFFFFFF);

  @override
  final Color blackColor = Colors.black;

  @override
  final Color dividerColor = const Color.fromARGB(255, 181, 181, 181);

  @override
  final Color iPadBackground = const Color(0xffF1F1F5); // Added new color value

  @override
  final Color itemColor = const Color(0xffDFDEE5);
}

final class DarkMyTheme implements MyTheme {
  @override
  final Color mainColor = const Color(0xFF7BD3EA);

  @override
  final Color backgroundColor = const Color(0xff000000);

  @override
  final Color textColor = Colors.white;

  @override
  final Color secondaryTextColor = Colors.white;

  @override
  final Color fieldColor = const Color(0xff26262A);

  @override
  final Color borderColor = const Color(0xff191919);

  @override
  final Color senderBubbleColor = CupertinoColors.activeBlue;

  @override
  final Color secondaryFadeTextColor = const Color.fromARGB(255, 209, 199, 199);

  @override
  final Color subtitleTextColor = const Color.fromARGB(255, 105, 105, 105);

  @override
  final Color destructiveColor = const Color(0xffFF0000);

  @override
  final Color secondaryColor = const Color(0xff26262A);

  @override
  final Color thirdFadeColor = const Color(0xff8d8d93);

  @override
  final Color whiteColor = const Color(0xff26262A);

  @override
  final Color blackColor = Colors.white;

  @override
  final Color dividerColor = const Color(0xff121212);

  @override
  final Color iPadBackground = const Color(0xff1B1B1B);

  @override
  final Color itemColor = const Color(0xff39383D);
}
