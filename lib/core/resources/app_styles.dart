import 'package:bookly_app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static var textBold = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );

  static var textSemiBold = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );
  static var textsmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );
  static var textBodyBold = GoogleFonts.aBeeZee(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
  );
  static var textBodySemiBold = GoogleFonts.lato(
    fontStyle: FontStyle.italic,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
}
