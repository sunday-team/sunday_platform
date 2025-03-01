import 'package:flutter/foundation.dart';
import 'package:shared_preferences_listener/shared_preferences_listener.dart';
import 'package:sunday_core/Print/print.dart';
import 'package:sunday_platform/style.dart';
import 'package:universal_io/io.dart';

class PlatformStyle {
  static const String styleKey = 'platform_style';

  static Style get current {
    // Check for custom style first
    final SharedPreferencesListener box = SharedPreferencesListener();

    String storedStyle = box.read(styleKey) ?? "";
    if (storedStyle.isEmpty) {
      return getPlatformStyle();
    }
    
    try {
      return Style.values.firstWhere((e) => e.toString() == storedStyle);
    } catch (_) {
      // If stored style is invalid, fall back to platform style
      return getPlatformStyle();
    }
  }

  static Style getPlatformStyle() {
    if (kIsWeb) {
      return Style.material;
    } else if (Platform.isIOS) {
      return Style.latestIOS;
    } else if (Platform.isMacOS) {
      return Style.latestIOS;
    } else if (Platform.isWindows) {
      return Style.fluent;
    }
     else if (Platform.isAndroid ||
        Platform.isLinux) {
      return Style.material;
    }
    return Style.material;
  }

  static void setStyle(Style style) async {
    final SharedPreferencesListener box = SharedPreferencesListener();

    box.write(styleKey, style.toString());
    sundayPrint("its ${box.read(styleKey)}");
  }
}
