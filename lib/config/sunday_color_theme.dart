import 'package:flutter/material.dart';

/// A class that defines the color theme for the Sunday platform
class SundayColorTheme {
  /// The background color of the app
  final SColor backgroundColor;
  
  /// The primary text color
  final SColor textColor;
  
  /// The subtitle text color
  final SColor subTitleTextColor;
  
  /// The color used for borders
  final SColor borderColor;
  
  /// The color used for background elements
  final SColor backgroundElementColor;

  /// Creates a [SundayColorTheme] with customizable colors
  /// 
  /// If any color is not provided, default values will be used
  SundayColorTheme({
    SColor? backgroundColor,
    SColor? textColor,
    SColor? subTitleTextColor,
    SColor? borderColor,
    SColor? backgroundElementColor,
  }) : backgroundColor = backgroundColor ?? const SColor(dark: Colors.blue, light: Colors.blue),
       textColor = textColor ?? const SColor(dark: Colors.white, light: Colors.black),
       subTitleTextColor = subTitleTextColor ?? SColor(dark: Colors.grey[300]!, light: Colors.grey[700]!),
       borderColor = borderColor ?? SColor(dark: Colors.grey[300]!, light: Colors.grey[700]!),
       backgroundElementColor = backgroundElementColor ?? SColor(dark: Colors.grey[300]!, light: Colors.grey[700]!);
}

/// A color class that provides different colors for light and dark themes
class SColor {
  /// The color to use in light theme
  final Color light;
  
  /// The color to use in dark theme
  final Color dark;
  
  /// Creates an [SColor] with required light and dark colors
  const SColor({
    required this.dark,
    required this.light
  });
}

Color sPColor(SColor sundaycolor, BuildContext context) {
  return MediaQuery.platformBrightnessOf(context) == Brightness.dark
      ? sundaycolor.dark
      : sundaycolor.light;
}