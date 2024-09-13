import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextThemes {
  static final TextTheme mainTheme = TextTheme(
      titleMedium: GoogleFonts.playfairDisplay(
        color: AppColors.primaryBurgundy,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      // drawer & app title
      headlineLarge: GoogleFonts.playfairDisplay(
        color: AppColors.primaryCream,
        fontSize: 28.0,
        fontWeight: FontWeight.w400,
      ),
      // product card title
      headlineMedium: GoogleFonts.playfairDisplay(
        color: AppColors.primaryBurgundy,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
      headlineSmall: GoogleFonts.playfairDisplay(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBurgundy,
      ),
      bodyLarge: GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryBurgundy,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 16,
        color: AppColors.accentBrown,
      ),
      bodySmall: GoogleFonts.playfairDisplay(
        color: AppColors.primaryBurgundy,
        fontSize: 14,
      ),
      labelLarge: GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryBurgundy,
      ),
      labelMedium: GoogleFonts.playfairDisplay(
        color: AppColors.primaryBurgundy,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.inter(color: AppColors.secondaryGreen),
      displaySmall: GoogleFonts.playfairDisplay(
        color: AppColors.primaryCream,
        fontWeight: FontWeight.w100,
        fontSize: 20.0,
      ),
      titleSmall: GoogleFonts.playfairDisplay(
        color: AppColors.primaryCream,
      ),
      displayMedium: GoogleFonts.playfairDisplay(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryGreen,
      ),
      displayLarge: GoogleFonts.playfairDisplay(
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryGreen, // Price color
        fontSize: 16,
      ));
}
