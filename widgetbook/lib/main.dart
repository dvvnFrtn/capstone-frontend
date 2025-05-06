import 'package:capstone_frontend/presentation/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appBuilder: (context, child) {
        return MaterialApp(
          theme: getTheme(),
          home: Scaffold(backgroundColor: Colors.white, body: child),
        );
      },
      themeMode: ThemeMode.dark,
      directories: directories,
      addons: [
        ViewportAddon(AndroidViewports.all),
        AlignmentAddon(),
        InspectorAddon(),
      ],
    );
  }
}
