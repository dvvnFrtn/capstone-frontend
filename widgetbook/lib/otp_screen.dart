import 'package:capstone_frontend/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: OtpScreen)
Widget defaultButtonUseCase(BuildContext context) {
  return OtpScreen(email: 'example@gmail.com');
}
