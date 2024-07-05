import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleLarge extends StatelessWidget {
  const TitleLarge(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 40,
      ),
    );
  }
}
