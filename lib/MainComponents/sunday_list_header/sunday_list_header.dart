import 'package:flutter/widgets.dart';
import 'package:sunday_ui/MainComponents/sunday_list_header/cupertino_list_header.dart';
import 'package:sunday_ui/MainComponents/sunday_list_header/material_list_header.dart';
import 'package:sunday_ui/style.dart';

/// A list header component for the Sunday UI package.
///
/// This widget adapts to the current style (Material or Cupertino) and renders
/// the appropriate list header implementation.
class SundayListHeader extends StatelessWidget {
  /// Creates a [SundayListHeader].
  const SundayListHeader({
    super.key,
    required this.style,
    required this.header,
  });

  /// The text to display as the header.
  final String header;

  /// The style of the list header (Material or Cupertino).
  final Style style;

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case Style.material:
        return SundayMaterialListHeader(header: header);
      case Style.cupertino:
      case Style.custom:
      case Style.latestIOS:
        return SundayCupertinoListHeader(header: header);
      default:
        throw UnimplementedError('Unsupported style: $style');
    }
  }
}
