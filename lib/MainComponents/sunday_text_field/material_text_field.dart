import 'package:flutter/material.dart';
import 'package:sunday_ui/style.dart';

/// A customizable Material-style text field for the Sunday UI framework.
///
/// This widget provides a text input field with Material design styling. 
/// It allows for customization of various properties such as label text, 
/// hint text, and input decoration.
///
/// ## Parameters
/// 
/// - `labelText`: The text to display as the label for the text field.
/// - `hintText`: The text to display as a hint when the text field is empty.
/// - `controller`: A controller for managing the text being edited.
/// - `onChanged`: A callback that is called when the text field's value changes.
/// - `keyboardType`: The type of keyboard to use for editing the text.
/// - `obscureText`: Whether to hide the text being edited (e.g., for passwords).
/// - `decoration`: Additional decoration to add to the text field.
/// - `style`: The style to use for this text field (Material, Cupertino, etc.).
///
/// ## Usage
/// 
/// To use the `SundayMaterialTextField`, you can create an instance of it 
/// in your widget tree. For example:
/// 
/// ```dart
/// SundayMaterialTextField(
///   labelText: 'Enter your name',
///   hintText: 'John Doe',
///   controller: myController,
///   onChanged: (value) {
///     // Handle the change
///   },
///   keyboardType: TextInputType.text,
///   obscureText: false,
///   style: Style.material,
/// )
/// ```
///
/// ## Example
/// 
/// Here is a complete example of how to use the `SundayMaterialTextField` 
/// within a Flutter application:
/// 
/// ```dart
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     final TextEditingController myController = TextEditingController();
///     
///     return MaterialApp(
///       home: Scaffold(
///         appBar: AppBar(title: Text('Material Text Field Example')),
///         body: Padding(
///           padding: const EdgeInsets.all(16.0),
///           child: SundayMaterialTextField(
///             labelText: 'Enter your name',
///             hintText: 'John Doe',
///             controller: myController,
///             onChanged: (value) {
///               print('Current value: $value');
///             },
///             keyboardType: TextInputType.text,
///             obscureText: false,
///             style: Style.material,
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
///
class SundayMaterialTextField extends StatelessWidget {
  /// The text to display as the label for the text field.
  final String? labelText;

  /// The text to display as a hint when the text field is empty.
  final String? hintText;

  /// A controller for managing the text being edited.
  final TextEditingController? controller;

  /// A callback that is called when the text field's value changes.
  final ValueChanged<String>? onChanged;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  /// Additional decoration to add to the text field.
  final InputDecoration? decoration;

  /// The style to use for this text field (Material, Cupertino, etc.).
  final Style style;

  /// Constructs a `SundayMaterialTextField` with the given properties.
  ///
  /// The `style` parameter is required and determines the style of the text field.
  const SundayMaterialTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.decoration,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: decoration ??
          InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
          ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
