import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.black87,
    ),
    headlineSmall: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 24,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 16,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(
      color: Colors.white70,
    ),
    headlineSmall: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 24,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 16,
    ),
  );
}
