import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:capstone_frontend/presentation/components/textfield_component.dart';

@widgetbook.UseCase(name: 'Default', type: XTextField)
Widget defaultTextFieldUseCase(BuildContext context) {
  final TextEditingController controller = TextEditingController();

  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: XTextField(
          label: 'Text',
          controller: controller,
          obsecure: context.knobs.boolean(
            label: 'obsecure?',
            initialValue: false,
          ),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Number', type: XTextField)
Widget numberTextFieldUseCase(BuildContext context) {
  final TextEditingController controller = TextEditingController();

  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: XTextField(
          label: 'Number',
          controller: controller,
          obsecure: context.knobs.boolean(
            label: 'obsecure?',
            initialValue: false,
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    ),
  );
}
