import 'package:capstone_frontend/data/validator.dart';
import 'package:capstone_frontend/presentation/components/button_component.dart';
import 'package:capstone_frontend/presentation/components/textfield_component.dart';
import 'package:capstone_frontend/presentation/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lupa Password',
          style: GoogleFonts.inter(
            color: XColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: XColors.white,
        leading: Icon(Icons.arrow_back),
        shadowColor: XColors.black.withAlpha(30),
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              height: 150.0,
              child: Center(child: Text('Atur ulang password')),
            ),
            ForgotPasswordForm(),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _npwController = TextEditingController();
  final _cpwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16.0,
        children: [
          XTextField(
            label: 'Password baru',
            controller: _npwController,
            obsecure: true,
            validator: passwordValidator,
          ),
          XTextField(
            label: 'Konfirmasi password',
            controller: _cpwController,
            obsecure: true,
            validator:
                (value) => confirmPasswordValidator(value, _npwController.text),
          ),
          XButton(
            label: 'Simpan',
            onPressed: () {
              _formKey.currentState!.validate();
            },
          ),
        ],
      ),
    );
  }
}
