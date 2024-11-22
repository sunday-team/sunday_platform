import 'package:flutter/cupertino.dart';
import 'package:sunday_ui/MainComponents/sunday_text/sunday_text.dart';
import 'package:sunday_ui/style.dart';

/// A Cupertino-style list tile for the Sunday UI package.
///
/// This widget wraps the [CupertinoListTile.notched] from the Flutter framework,
/// customized for the Sunday UI package.
class SundayCupertinoListTile extends StatelessWidget {
  /// Creates a [SundayCupertinoListTile].
  const SundayCupertinoListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.additionalInfo,
    required this.style,
  });

  /// A widget to display before the title.
  final Widget? leading;

  /// The primary content of the list tile.
  final Widget? title;

  /// Additional content displayed below the title.
  final Widget? subtitle;

  /// A widget to display after the title.
  final Widget? trailing;

  /// Called when the user taps this list tile.
  final VoidCallback? onTap;

  /// The tile's background color.
  final Color? backgroundColor;

  /// The internal padding for the list tile's contents.
  final EdgeInsetsGeometry? padding;

  /// Additional information to display below the [subtitle].
  final String? additionalInfo;

  /// The style to apply to the text.
  final Style style;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leading: leading != null
          ? SizedBox(
              width: 50,
              height: 50,
              child: leading,
            )
          : null,
      title: title ?? SundayText("", style: style),
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
      backgroundColor: backgroundColor,
      padding: padding,
      additionalInfo: Text(additionalInfo ?? ""),
    );
  }
}
