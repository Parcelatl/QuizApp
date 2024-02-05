import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      backgroundColor: Color.fromARGB(255, 49, 33, 52),//const Color.fromARGB(255, 35, 44, 49),//Color.fromARGB(51, 155, 0, 140),
      foregroundColor: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  fontFamily: GoogleFonts.aDLaMDisplay().fontFamily, //ADlam Here
);
