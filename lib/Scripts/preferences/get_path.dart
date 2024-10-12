import 'package:flutter/cupertino.dart';

String getPath(BuildContext context) {
  final element = context as Element;
  String path = '';
  element.visitAncestorElements((ancestor) {
    path = '${ancestor.widget.runtimeType}/$path';
    return true;
  });
  return path;
}
