/// Enum representing different styles for the UI.
enum Style {
  /// Material design style.
  material,

  /// Cupertino (iOS) design style.
  cupertino,

  /// Latest iOS design style.
  latestIOS,

  /// Macos design style.
  macos,

  /// Fluent design style.
  fluent
}

/// Helper class for managing and checking different UI styles.
class StyleHelper {
  /// The current style.
  final Style style;

  /// Creates a [StyleHelper] with the given [style].
  const StyleHelper({required this.style});

  /// A [StyleHelper] instance for Material design style.
  static const StyleHelper material = StyleHelper(style: Style.material);

  /// A [StyleHelper] instance for Cupertino design style.
  static const StyleHelper cupertino = StyleHelper(style: Style.cupertino);

  /// A [StyleHelper] instance for the latest iOS design style.
  static const StyleHelper latestIOS = StyleHelper(style: Style.latestIOS);

  /// A [StyleHelper] instance for the latest macOS design style.
  static const StyleHelper macos = StyleHelper(style: Style.macos);

  /// Checks if the current style is Material design.
  bool get isMaterial => style == Style.material;

  /// Checks if the current style is Cupertino design.
  bool get isCupertino => style == Style.cupertino;

  /// Checks if the current style is the latest iOS design.
  bool get isLatestIOS => style == Style.latestIOS;

  /// Checks if the current style is the latest iOS design.
  bool get isLatestMacOS => style == Style.macos;

  /// Checks if the current style is the Fluent design.
  bool get isFluent => style == Style.fluent;
}
