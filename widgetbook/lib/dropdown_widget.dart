import 'package:capstone_frontend/data/model/province_model.dart';
import 'package:capstone_frontend/presentation/components/dropdown_component.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: XDropDown)
Widget defaultDropDownUseCase(BuildContext context) {
  TextEditingController controller = TextEditingController();
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: XDropDown<Province>(
          label: 'Select',
          controller: controller,
          entries: [
            DropdownMenuEntry(
              value: Province(id: '11.0', name: 'Jawa Timur'),
              label: 'Jawa Timur',
            ),
            DropdownMenuEntry(
              value: Province(id: '11.1', name: 'Jawa Tengah'),
              label: 'Jawa Tengah',
            ),
            DropdownMenuEntry(
              value: Province(id: '11.2', name: 'Jawa Barat'),
              label: 'Jawa Barat',
            ),
          ],
        ),
      ),
    ),
  );
}
