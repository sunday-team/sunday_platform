import 'package:flutter/cupertino.dart';
import 'package:sunday_platform/sunday_platform.dart';

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
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(33, 10, 0, 0),
          child: SundayText(
            header.toUpperCase(),
            style: Style.cupertino,
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ),
      ],
    );
  }
}
