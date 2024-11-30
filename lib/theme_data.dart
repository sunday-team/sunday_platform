import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Abstract class defining the color theme interface for the application.
///
/// This class extends [ColorTheme] and defines the color scheme used throughout
/// the application. It provides a consistent way to access colors for both light
/// and dark themes.
abstract class MyTheme implements ColorTheme {
  /// The main brand color used throughout the application.
  Color get mainColor;

  /// A secondary color used for accents and highlights.
  Color get secondaryColor;

  /// Color used for destructive or warning actions.
  Color get destructiveColor;

  /// The primary background color for the application.
  Color get backgroundColor;

  /// The primary text color.
  Color get textColor;

  /// Secondary text color, often used for contrast against different backgrounds.
  Color get secondaryTextColor;

  /// A faded version of the secondary text color for less emphasis.
  Color get secondaryFadeTextColor;

  /// Background color for input fields and form elements.
  Color get fieldColor;

  /// Color used for borders and dividing lines.
  Color get borderColor;

  /// Background color for sender message bubbles in chat interfaces.
  Color get senderBubbleColor;

  /// Color used for subtitle or secondary text content.
  Color get subtitleTextColor;

  /// A third level of faded color for various UI elements.
  Color get thirdFadeColor;

  /// Pure white color used in the theme.
  Color get whiteColor;

  /// Pure black color used in the theme.
  Color get blackColor;

  /// Color used for dividers between content sections.
  Color get dividerColor;

  /// Background color specifically for iPad interfaces.
  Color get iPadBackground;

  /// Color used for standard items or list elements.
  Color get itemColor;
}

/// Implementation of [MyTheme] for light mode.
///
/// Defines all the colors used when the application is in light mode.
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
  final Color iPadBackground = const Color(0xffF1F1F5);

  @override
  final Color itemColor = const Color(0xffDFDEE5);
}

/// Implementation of [MyTheme] for dark mode.
///
/// Defines all the colors used when the application is in dark mode.
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
