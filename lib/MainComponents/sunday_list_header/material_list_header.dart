import 'package:flutter/cupertino.dart';
import 'package:sunday_ui/MainComponents/sunday_text/sunday_text.dart';
import 'package:sunday_ui/style.dart';

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
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
          child: SundayText(
            header,
            style: Style.material,
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ),
      ],
    );
  }
}
