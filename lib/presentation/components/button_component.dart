import 'package:capstone_frontend/presentation/styles/theme.dart';
import 'package:flutter/material.dart';

class XButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const XButton({required this.label, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        visualDensity: VisualDensity.standard,
        maximumSize: WidgetStatePropertyAll(Size.fromHeight(52.0)),
        minimumSize: WidgetStatePropertyAll(Size.fromHeight(52.0)),
        backgroundColor: WidgetStateColor.fromMap({
          WidgetState.any: XColors.primary,
        }),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: XColors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
