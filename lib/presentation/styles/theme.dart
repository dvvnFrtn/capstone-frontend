import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme() {
  return ThemeData(textTheme: GoogleFonts.interTextTheme());
}

class XColors {
  static const Color primary = Color(0xFF145AE6);
  static const Color accent = Color(0xFFFFD447);
  static const Color secondary = Color(0xFF93B3F4);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF333333);
  static const Color grey = Color(0xFFB5B5B5);
  static const Color yellow100 = Color(0xFFFFF2C6);
}
