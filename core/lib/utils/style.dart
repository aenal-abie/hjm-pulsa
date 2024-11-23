import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../component/styles/index.dart';

TextStyle customTextStyle(BuildContext context,
        {Color? color, double? fontSize, FontWeight? fontWeight}) =>
    GoogleFonts.poppins(
        color: color,
        fontSize: (fontSize ?? 12) * MediaQuery.textScaleFactorOf(context),
        fontWeight: fontWeight ?? FontWeight.w400);

String defaultFontFamily() => GoogleFonts.poppins.toString();

TextStyle heading1Style = GoogleFonts.poppins(
  fontSize: 34,
  fontWeight: FontWeight.w400,
);

TextStyle heading2Style = GoogleFonts.poppins(
  fontSize: 28,
  fontWeight: FontWeight.w600,
);

TextStyle heading3Style = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

TextStyle headlineStyle = GoogleFonts.poppins(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

TextStyle bodyStyle = GoogleFonts.poppins(color: neutralColor500, fontSize: 12);

TextStyle subheadingStyle = GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

TextStyle captionStyle = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);
