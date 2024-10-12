import 'dart:ui';

import 'package:sunday_core/GetGtorage/get_storage.dart';

/// Stores a Color object as an integer value in local storage.
///
/// This function takes a [Color] object and a [String] key, and stores the
/// color's integer value in local storage using the provided key.
///
/// Parameters:
/// - [color]: The Color object to be stored.
/// - [key]: A unique string identifier used to store and later retrieve the color.
///
/// Example:
/// ```dart
/// Color myColor = Colors.blue;
/// storingColor(myColor, 'my_blue_color');
/// ```
///
/// The color is stored as an integer (color.value) for efficient storage and retrieval.
/// To retrieve the stored color, use the corresponding retrieval function.
void storingColor(Color color, String key) {
  final box = SundayGetStorage();
  box.write(key, color.value); // Store as integer
}

/// Converts a Color object to its integer representation.
///
/// This function takes a [Color] object and returns its integer value.
/// The integer value represents the color in ARGB format.
///
/// Parameters:
/// - [color]: The Color object to be converted.
///
/// Returns:
/// An integer representing the color value.
///
/// Example:
/// ```dart
/// Color myColor = Colors.red;
/// int colorValue = convertColor(myColor);
/// print(colorValue); // Outputs: 4294901760 (0xFFFF0000 in hexadecimal)
/// ```
int convertColor(Color color) {
  return color.value;
}
