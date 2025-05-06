import 'package:capstone_frontend/presentation/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ForgotPasswordScreen)
Widget defaultForgotPasswordScreenUseCase(BuildContext context) {
  return ForgotPasswordScreen();
}
