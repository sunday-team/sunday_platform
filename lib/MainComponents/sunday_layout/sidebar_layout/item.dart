import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunday_core/Print/print.dart';

/// A widget representing an item in the sidebar.
class SidebarItem extends StatefulWidget {
  /// Creates a [SidebarItem].
  ///
  /// The [onTap], [icon], [text], [keyIndex], [itemTextColor], [darkItemTextColor], and [selectedIndex] parameters
  /// must not be null.
  const SidebarItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    required this.keyIndex,
    required this.selectedIndex,
    this.itemTextColor = Colors.black,
    this.darkItemTextColor = Colors.white,
    this.itemBackgroundColor = const Color(0xffDFDEE5),
    this.darkItemBackgroundColor = const Color(0xff39383D),
  });

  /// Callback function to be executed when the item is tapped.
  final void Function() onTap;

  /// Icon to be displayed in the sidebar item.
  final Widget icon;

  /// Text to be displayed in the sidebar item.
  final String text;

  /// Unique key index for the sidebar item.
  final String keyIndex;

  /// Index of the currently selected item.
  final String selectedIndex;

  /// The color of the text of the sidebar layout in dark mode.
  final Color darkItemTextColor;

  /// The color of the text of the sidebar layout.
  final Color itemTextColor;

  /// The color of the background of the item.
  final Color itemBackgroundColor;

  /// The color of the background of the item in dark mode.
  final Color darkItemBackgroundColor;

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

/// State class for [SidebarItem].
class _SidebarItemState extends State<SidebarItem> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the current theme from the context.
    return GestureDetector(
      onTap: () {
        // Log the tap event on the SidebarItem with its keyIndex.
        sundayPrint('SidebarItem tapped with keyIndex: ${widget.keyIndex}');
        // Execute the onTap callback.
        widget.onTap();
      },
      child: Container(
        // Set padding for the container.
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        // Set margin for the container.
        margin: const EdgeInsets.fromLTRB(20, 0, 30, 10),
        // Define the decoration for the container.
        decoration: BoxDecoration(
          // Set the border radius for the container.
          borderRadius: BorderRadius.circular(10),
          // Set the background color based on selection state.
          color: widget.selectedIndex == widget.keyIndex
              ? (MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? widget.darkItemBackgroundColor
                  : widget.itemBackgroundColor)
              : CupertinoColors.transparent,
        ),
        // Set the height of the container.
        height: 45,
        child: Row(
          children: [
            // Display the icon in the row.
            widget.icon,
            // Add spacing between the icon and text.
            const SizedBox(width: 10),
            // Display the text with specific styling.
            Text(
              widget.text,
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color:
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? widget.darkItemTextColor
                        : widget.itemTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
