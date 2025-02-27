import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SundayColorTheme {
  final SColor background;
  final SColor textColor;
  final SColor subTitleTextColor;
  
  SundayColorTheme({
    SColor? background,
    SColor? textColor,
    SColor? subTitleTextColor
  }) : background = background ?? const SColor(dark: Colors.blue, light: Colors.blue),
       textColor = textColor ?? const SColor(dark: Colors.white, light: Colors.black),
       subTitleTextColor = subTitleTextColor ?? SColor(dark: Colors.grey[300]!, light: Colors.grey[700]!);
}

class SColor {
  final Color light;
  final Color dark;
  
  const SColor({
    required this.dark,
    required this.light
  });
}
