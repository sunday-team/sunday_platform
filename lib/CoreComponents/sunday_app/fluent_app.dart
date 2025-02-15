import 'package:fluent_ui/fluent_ui.dart';

/// A customizable Fluent-style application widget for Sunday UI.
///
/// This widget serves as the root of your Fluent-style application and provides
/// various configuration options for theming, routing, and debugging.
class SundayFluentApp extends StatelessWidget {
  /// The theme to use for the application.
  final FluentThemeData? theme;

  /// The widget for the default route of the app (the first screen shown).
  final Widget home;

  /// The application's top-level routing table.
  final Map<String, WidgetBuilder>? routes;

  /// The name of the first route to show.
  final String? initialRoute;

  /// A key to use when building the application.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The title of the app, typically shown in the operating system's task switcher.
  final String title;

  /// Creates a [FluentApp].
  ///
  /// At least the [home] and [title] arguments must be non-null.
  const SundayFluentApp({
    super.key,
    this.theme,
    required this.home,
    required this.title,
    this.routes,
    this.initialRoute,
    this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      theme: theme ?? FluentThemeData(),
      home: home,
      title: title,
      routes: routes ?? {},
      initialRoute: initialRoute,
      navigatorKey: navigatorKey,
      onGenerateRoute: null,
      onGenerateInitialRoutes: null,
      onUnknownRoute: null,
      navigatorObservers: const [],
      builder: null,
      onGenerateTitle: null,
      color: null,
      locale: null,
      localizationsDelegates: null,
      localeListResolutionCallback: null,
      localeResolutionCallback: null,
      supportedLocales: FluentLocalizations.supportedLocales,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      shortcuts: null,
      actions: null,
      darkTheme: null,
      themeMode: null,
      restorationScopeId: null,
      scrollBehavior: const FluentScrollBehavior(),
    );
  }
}