import 'package:flutter/cupertino.dart';
import 'package:sunday_core/Print/print.dart';
import 'package:sunday_get_storage/sunday_get_storage.dart';

/// A widget that provides a toggle button for the sidebar.
class ToggleSidebarButton extends StatefulWidget {
  /// Creates a toggle button for the sidebar.
  const ToggleSidebarButton({super.key, required this.keyCollapsed});

  /// The key of the collapsed state.
  final String keyCollapsed;

  @override
  State<ToggleSidebarButton> createState() => _ToggleSidebarButtonState();
}

/// The state for the [ToggleSidebarButton] widget.
class _ToggleSidebarButtonState extends State<ToggleSidebarButton> {
  /// Whether the sidebar is collapsed.
  bool isVisible = false;

  /// Storage box for persisting the collapsed state.
  GetStorage? _box;

  /// Subscription for the storage listener
  Function? disposeListen;

  @override
  void initState() {
    super.initState();
    _initStorage();
  }

  Future<void> _initStorage() async {
    try {
      await GetStorage.init();
      _box = GetStorage();

      disposeListen = _box
          ?.listenKey("sidebar-layout-process-${widget.keyCollapsed}", (value) {
        if (!mounted) return;
        sundayPrint("value: $value");
        if (value != null && value is Map) {
          if (value["action"] == "collapse" &&
              value["whichIsTapped"] == "sidebar-layout-toogle-button") {
            setState(() {
              isVisible = true;
            });
          }
        }
      });
    } catch (e) {
      sundayPrint("Error initializing storage: $e");
    }
  }

  @override
  void dispose() {
    if (disposeListen != null) {
      disposeListen?.call();
    }
    super.dispose();
  }

  /// Toggles the collapsed state of the sidebar.
  Future<void> toogleButton() async {
    try {
      final state = {
        "isCollapsed": !isVisible,
        "whichIsTapped": "toogle-button",
        "action": "collapse",
      };

      await _box?.write("sidebar-layout-process-${widget.keyCollapsed}", state);

      if (mounted) {
        setState(() {
          isVisible = !isVisible;
        });
      }
    } catch (e) {
      sundayPrint("Error toggling button: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return isVisible ? GestureDetector(
        onTap: toogleButton,
        child: const Icon(CupertinoIcons.sidebar_left),
    
    ) : const SizedBox();
  }
}
