import 'dart:ui';

import 'package:sunday_core/GetGtorage/get_storage.dart';

/// Retrieves a Color object from local storage using a given key.
///
/// This function takes a [String] key and retrieves the corresponding color
/// value from local storage. If no color is found for the given key, it
/// defaults to white (0xFFFFFFFF).
///
/// Parameters:
/// - [key]: A unique string identifier used to retrieve the stored color.
///
/// Returns:
/// A [Color] object representing the retrieved color.
///
/// Example:
/// ```dart
/// Color myColor = retrievingColor('my_blue_color');
/// ```
///
/// This function is designed to work in conjunction with the `storingColor`
/// function, which stores colors in local storage.
Color retrievingColor(String key) {
  final box = SundayGetStorage();
  int colorValue = box.read(key) as int? ?? 0xFFFFFFFF;  // Default to white if no color is stored
  return Color(colorValue);  // Convert the integer back to Color
}