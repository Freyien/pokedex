import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonTheme {
  static ThemeData get dark {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Colors.white.withOpacity(.30),
        contentPadding: const EdgeInsets.all(0),
        hintStyle: GoogleFonts.inter(
          color: Colors.white.withOpacity(.60),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIconColor: Colors.white.withOpacity(.60),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 40,
        ),
      ),
      textTheme: GoogleFonts.interTextTheme(
        const TextTheme(
          bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: const Color(0xff999999),
        ),
        labelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Colors.white,
        ),
        dividerColor: Colors.transparent,
      ),
      indicatorColor: const Color(0xffF8F8F8),
    );
  }
}
