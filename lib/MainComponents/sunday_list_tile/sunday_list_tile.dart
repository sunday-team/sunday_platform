import 'package:flutter/widgets.dart';
import 'package:sunday_ui/MainComponents/sunday_list_tile/cupertino_list_tile.dart';
import 'package:sunday_ui/MainComponents/sunday_list_tile/material_list_tile.dart';
import 'package:sunday_ui/style.dart';

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
          contentPadding: padding as EdgeInsets?,
        );
      case Style.cupertino:
        return SundayCupertinoListTile(
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          onTap: onTap,
          backgroundColor: backgroundColor,
          padding: padding as EdgeInsetsDirectional?,
          additionalInfo: additionalInfo,
          style: style,
        );
      case Style.custom:
      case Style.latestIOS:
        return SundayCupertinoListTile(
          leading:
              ClipRRect(borderRadius: BorderRadius.circular(6), child: leading),
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          onTap: onTap,
          backgroundColor: backgroundColor,
          padding: padding as EdgeInsetsDirectional?,
          additionalInfo: additionalInfo,
          style: style,
        );
      default:
        throw UnimplementedError('Unsupported style: $style');
    }
  }
}
