import 'package:flutter/material.dart';

/// A Material-style list tile for the Sunday UI package.
///
/// This widget wraps the [ListTile] from the Flutter framework,
/// customized for the Sunday UI package.
class SundayMaterialListTile extends StatelessWidget {
  /// Creates a [SundayMaterialListTile].
  const SundayMaterialListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.tileColor,
    this.contentPadding,
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

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        leading: leading != null
            ? SizedBox(
                width: 40,
                height: 40,
                child: leading,
              )
            : null,
        title: Row(
          children: [
            title ?? const SizedBox(),
            const Spacer(),
            trailing ?? const SizedBox(),
          ],
        ),
        subtitle: subtitle,
        onTap: onTap,
        tileColor: tileColor,
        contentPadding: contentPadding,
      ),
    );
  }
}
