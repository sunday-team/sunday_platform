import 'package:flutter/cupertino.dart';

/// Returns the widget hierarchy path of the given [context].
///
/// This function traverses the ancestor elements of the given [context]
/// and constructs a string representing the widget hierarchy path.
///
/// The [context] parameter must be a [BuildContext] from which the widget
/// hierarchy path will be derived.
///
/// Example:
/// ```dart
/// String path = getPath(context);
/// print(path); // Output: "MyApp/Scaffold/Column/Text/"
/// ```
///
/// [context]: The [BuildContext] from which to derive the widget hierarchy path.
String getPath(BuildContext context) {
  final element = context as Element;
  String path = '';

  /// Visits the ancestor elements of the given [element] and constructs
  /// the widget hierarchy path.
  ///
  /// The [ancestor] parameter represents each ancestor element visited.
  /// The widget type of each ancestor is appended to the [path] string.
  element.visitAncestorElements((ancestor) {
    path = '${ancestor.widget.runtimeType}/$path';
    return true;
  });

  return path;
}
