import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunday_platform/MainComponents/sunday_text/sunday_text.dart';
import 'package:sunday_platform/style.dart';

/// A Material-style list tile for the Sunday UI package.
///
/// This widget wraps the [ListTile] from the Flutter framework,
/// customized for the Sunday UI package.
class SundayLatestIOSListTile extends StatelessWidget {
  /// Creates a [SundayMaterialListTile].
  const SundayLatestIOSListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.tileColor,
    this.contentPadding,
    this.width,
    this.height,
    this.leadingSize,
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
  final Color? tileColor;

  /// The internal padding for the list tile's contents.
  final EdgeInsetsGeometry? contentPadding;

  /// The width of the leading widget.
  final double? width;

  /// The height of the leading widget.
  final double? height;

  /// The size of the leading widget.
  final double? leadingSize;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      leadingSize: leadingSize ?? 30,
      leading: leading != null
          ? SizedBox(
              width: width,
              height: height,
              child: leading,
            )
          : null,
      title: title ?? const SundayText("", style: Style.latestIOS),
      subtitle: subtitle,
      trailing: trailing,
      onTap: onTap,
      backgroundColor: tileColor,
      padding: contentPadding,
    );
  }
}
