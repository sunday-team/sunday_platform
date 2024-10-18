import 'package:flutter/cupertino.dart';

/// A Cupertino-style list header for the Sunday UI package.
class SundayCupertinoListHeader extends StatelessWidget {
  /// Creates a [SundayCupertinoListHeader].
  const SundayCupertinoListHeader({
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
        header.toUpperCase(),
        style: TextStyle(color: MediaQuery.of(context).platformBrightness == Brightness.light ? const Color.fromARGB(255, 40, 39, 39) : const Color.fromARGB(255, 209, 199, 199), fontSize: 12),
      ),
    );
  }
}
