import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:capstone_frontend/presentation/components/button_component.dart';

@widgetbook.UseCase(name: 'Default', type: XButton)
Widget defaultButtonUseCase(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: XButton(label: 'Button'),
      ),
    ),
  );
}
