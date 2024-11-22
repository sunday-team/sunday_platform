import 'package:flutter/cupertino.dart';

/// A package that provides basic widgets for Flutter apps.
import 'package:flutter/widgets.dart';
import 'package:sunday_core/Print/print.dart';

/// A package that provides persistent storage functionality.
/// See: https://pub.dev/packages/sunday_get_storage
import 'package:sunday_get_storage/sunday_get_storage.dart';

/// A widget that provides a toggle button for the sidebar.
class ToogleSidebarButton extends StatefulWidget {
  /// Creates a toggle button for the sidebar.
  const ToogleSidebarButton({super.key, required this.keyCollapsed});

  /// The key of the collapsed state.
  final String keyCollapsed;

  @override
  State<ToogleSidebarButton> createState() => _ToogleSidebarButtonState();
}

/// The state for the [ToogleSidebarButton] widget.
class _ToogleSidebarButtonState extends State<ToogleSidebarButton> {
  /// Whether the sidebar is collapsed.
  bool isVisible = false;

  /// Storage box for persisting the collapsed state.
  final box = GetStorage();

  /// Subscription for the storage listener
  Function? disposeListen;

  @override
  void initState() {
    disposeListen = box.listenKey("sidebar-layout-process-${widget.keyCollapsed}", (value) {
      sundayPrint("value: $value");
      if (value["action"] == "collapse") {
        if (value["whichIsTapped"] == "sidebar-layout-toogle-button") {
          setState(() {
            isVisible = true;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    if (disposeListen != null) {
      disposeListen?.call();
    }
    super.dispose();
  }

  /// Toggles the collapsed state of the sidebar.
  void toogleButton() {
    var state = {
      "isCollapsed": !isVisible,
      "whichIsTapped": "toogle-button",
      "action": "collapse",
    };
    box.write("sidebar-layout-process-${widget.keyCollapsed}", state);
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: GestureDetector(
        onTap: toogleButton,
        child: const Icon(CupertinoIcons.sidebar_left),
      ),
    );
  }
}
