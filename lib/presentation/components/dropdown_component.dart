import 'package:capstone_frontend/presentation/styles/theme.dart';
import 'package:flutter/material.dart';

class XDropDown<T> extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final List<DropdownMenuEntry<T>> entries;
  final void Function(T?)? onSelected;
  const XDropDown({
    required this.label,
    required this.controller,
    required this.entries,
    this.onSelected,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4.0,
      children: [
        Text(
          label,
          style: TextStyle(
            color: XColors.black,
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        DropdownMenu<T>(
          onSelected: onSelected,
          controller: controller,
          requestFocusOnTap: true,
          enableFilter: true,
          expandedInsets: EdgeInsets.zero,
          textStyle: TextStyle(color: XColors.black, fontSize: 14.0),
          menuStyle: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(XColors.white),
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            visualDensity: VisualDensity.standard,
            side: WidgetStatePropertyAll(BorderSide(color: XColors.grey)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: WidgetStateInputBorder.fromMap({
              WidgetState.focused: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: XColors.primary),
              ),
              WidgetState.error: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.red.shade400),
              ),
              WidgetState.any: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: XColors.grey),
              ),
            }),
          ),
          dropdownMenuEntries: entries,
        ),
      ],
    );
  }
}
