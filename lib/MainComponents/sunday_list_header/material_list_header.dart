import 'package:flutter/material.dart';

/// A Material-style list header for the Sunday UI package.
class SundayMaterialListHeader extends StatelessWidget {
  /// Constructs a [SundayMaterialListHeader] with the given [header].
  const SundayMaterialListHeader({
    super.key,
    required this.header,
  });

  /// The text to display as the header.
  final String header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        header,
        style: TextStyle(
          color: MediaQuery.of(context).platformBrightness == Brightness.light ? const Color(0xFF282B2D) : const Color(0xFF6B7280),
          fontSize: 12,
        ),
      ),
    );
  }
}
