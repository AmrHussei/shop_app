import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  const TextUtils(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color});

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
              color: color, fontSize: fontSize, fontWeight: fontWeight),
        ));
  }
}
