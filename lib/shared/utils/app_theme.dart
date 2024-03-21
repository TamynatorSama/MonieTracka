import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color btnColor = Color(0xffFAA713);
  static const Color primaryColor = Color(0xffD9B38C);
  // static const Color primaryColor = Color(0xffD9B38C);


  static TextStyle headerStyle = GoogleFonts.spaceGrotesk(
    color: const Color(0xff222222),
    fontWeight: FontWeight.w700,
    fontSize: 24
  );

  static TextStyle bodyText = GoogleFonts.manrope(
    color: const Color(0xff7E7E7E),
    fontWeight: FontWeight.w500,
    fontSize: 10
  );
  static TextStyle bodyTextBold = GoogleFonts.manrope(
    color: const Color(0xff7E7E7E),
    fontWeight: FontWeight.w600,
    fontSize: 12
  );
  static TextStyle buttonStyle = GoogleFonts.spaceGrotesk(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 16
  );
}
