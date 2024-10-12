enum Style {
  material,
  cupertino,
  custom,
  latestIOS,
}

class StyleHelper {
  final Style style;

  const StyleHelper({required this.style});

  static const StyleHelper material = StyleHelper(style: Style.material);
  static const StyleHelper cupertino = StyleHelper(style: Style.cupertino);
  static const StyleHelper custom = StyleHelper(style: Style.custom);
  static const StyleHelper latestIOS = StyleHelper(style: Style.latestIOS);

  bool get isMaterial => style == Style.material;
  bool get isCupertino => style == Style.cupertino;
  bool get isCustom => style == Style.custom;
  bool get isLatestIOS => style == Style.latestIOS;
}

