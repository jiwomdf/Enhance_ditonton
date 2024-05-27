// text_styles.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// text style
final TextStyle kHeading5 =
    GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle kHeading6 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle kSubtitle = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle kBodyText = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

final TextStyle headlineSmall = GoogleFonts.roboto(
    fontSize: 23, fontWeight: FontWeight.w300, color: Colors.white);

final TextStyle appTitleLarge = GoogleFonts.roboto(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: Colors.white);

final TextStyle titleLarge = GoogleFonts.roboto(
    fontSize: 19,
    fontWeight: FontWeight.w300,
    letterSpacing: 0.15,
    color: Colors.white);

// text theme
final kTextTheme = TextTheme(
  headlineLarge: kHeading5,
  headlineMedium: kHeading6,
  titleLarge: kSubtitle,
  titleMedium: kBodyText,
);
