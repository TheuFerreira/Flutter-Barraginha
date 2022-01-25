
import 'package:flutter/material.dart';
import 'package:flutter_barraginha/Consts/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles
{
  static TextStyle title = GoogleFonts.roboto
  (
    color: Colors.white, 
    fontWeight: FontWeight.w500,
    fontSize: 25
  );

  static TextStyle titleBold = GoogleFonts.roboto
  (
    color: AppColors.textBoldColor,
    fontWeight: FontWeight.bold,
    fontSize: 20
  );

    static TextStyle titleNormal = GoogleFonts.roboto
  (
    color: AppColors.textBoldColor,
    fontWeight: FontWeight.normal,
    fontSize: 17
  );

      static TextStyle textNormal = GoogleFonts.roboto
  (
    color: AppColors.lightTextColor,
    fontWeight: FontWeight.normal,
    fontSize: 15
  );
}