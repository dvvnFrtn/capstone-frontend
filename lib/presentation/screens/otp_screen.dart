import 'package:capstone_frontend/presentation/components/button_component.dart';
import 'package:capstone_frontend/presentation/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({required this.email, super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = '';
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XColors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [XColors.primary, XColors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 300.0,
                width: double.maxFinite,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 24.0,
                    children: [
                      Text(
                        'Kode Verifikasi',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: XColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        'Masukkan kode OTP yang dikirimkan pada alamat email ${widget.email}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: XColors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              OtpTextField(
                fieldWidth: 44.0,
                fieldHeight: 44.0,
                keyboardType: TextInputType.number,
                numberOfFields: 6,
                showFieldAsBox: true,
                filled: true,
                fillColor: XColors.white,
                textStyle: GoogleFonts.inter(
                  color: XColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
                margin: EdgeInsets.all(4.0),
                cursorColor: XColors.primary,
                enabledBorderColor: Colors.transparent,
                focusedBorderColor: XColors.primary,
                borderColor: XColors.primary,
                borderRadius: BorderRadius.circular(12.0),
                handleControllers: (controllers) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      otp = controllers.map((v) => v?.text ?? '').join();
                    });
                  });
                },
              ),
              SizedBox(height: 64.0, width: double.maxFinite),
              XButton(
                label: 'Verifikasi',
                onPressed: () {
                  if (otp.length < 6) {
                    setState(() {
                      errorMessage = 'Kode OTP harus diisi 6 digit';
                    });
                    return;
                  }

                  setState(() {
                    errorMessage = null;
                  });
                },
              ),
              SizedBox(height: 32.0, width: double.maxFinite),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: Colors.red,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
