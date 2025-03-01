import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SundayColorTheme {
  final SColor backgroundColor;
  final SColor textColor;
  final SColor subTitleTextColor;
  final SColor borderColor;
  final SColor backgroundElementColor;
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

class SColor {
  final Color light;
  final Color dark;
  
  const SColor({
    required this.dark,
    required this.light
  });
}
