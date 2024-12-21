import 'package:flutter/widgets.dart';
import 'package:sunday_platform/MainComponents/sunday_list_tile/cupertino_list_tile.dart';
import 'package:sunday_platform/MainComponents/sunday_list_tile/latestios_list_tile.dart';
import 'package:sunday_platform/MainComponents/sunday_list_tile/material_list_tile.dart';
import 'package:sunday_platform/style.dart';

/// A list tile component for the Sunday UI package.
///
/// This widget adapts to the current style (Material or Cupertino) and renders
/// the appropriate list tile implementation.
class SundayListTile extends StatelessWidget {
  /// Creates a [SundayListTile].
  const SundayListTile({
    super.key,
    required this.style,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.additionalInfo,
    this.width,
    this.height,
    this.leadingSize,
  });

  /// The style of the list tile (Material or Cupertino).
  final Style style;

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

  /// Additional information to display (only used in Cupertino style).
  final String? additionalInfo;

  /// The width of the leading widget.
  final double? width;

  /// The height of the leading widget.
  final double? height;

  /// The size of the leading widget.
  final double? leadingSize;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.material:
        return SundayMaterialListTile(
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          onTap: onTap,
          tileColor: backgroundColor,
          contentPadding: padding,
        );
      case Style.cupertino:
        return SundayCupertinoListTile(
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          onTap: onTap,
          backgroundColor: backgroundColor,
          padding: padding,
          additionalInfo: additionalInfo,
          style: style,
        );
      case Style.custom:
      case Style.latestIOS:
        return SundayLatestIOSListTile(
          leadingSize: leadingSize,
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          onTap: onTap,
          tileColor: backgroundColor,
          contentPadding: padding ?? const EdgeInsets.fromLTRB(10, 5, 10, 5),
          width: width,
          height: height,
        );
      default:
        throw UnimplementedError('Unsupported style: $style');
    }
  }
}
