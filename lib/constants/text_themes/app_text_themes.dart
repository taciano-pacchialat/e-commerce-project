import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextThemes {
  static final TextTheme lightTextTheme = TextTheme(
      // Drawer & App Title
      titleLarge: GoogleFonts.playfairDisplay(
        color: AppColors.primaryCream,
        fontSize: 28.0,
        fontWeight: FontWeight.w400,
      ),
      // Drawer items
      titleMedium: GoogleFonts.playfairDisplay(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryBurgundy,
      ),
      // Product card title
      // Copied with size 20 for H&S dropdown titles
      titleSmall: GoogleFonts.playfairDisplay(
        color: AppColors.primaryBurgundy,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
      // Prices
      // Copied with fontSize: 20.0 for the product card
      labelMedium: GoogleFonts.playfairDisplay(
        color: AppColors.secondaryGreen,
        fontWeight: FontWeight.w300,
        fontSize: 28.0,
      ),
      // Buttons
      labelSmall: GoogleFonts.playfairDisplay(
        color: AppColors.primaryCream,
        fontSize: 15.0,
      ),
      // Product detail title
      bodyLarge: GoogleFonts.playfairDisplay(
        color: AppColors.primaryBurgundy,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      // Product detail headings (description, characteristics, etc.)
      headlineSmall: GoogleFonts.playfairDisplay(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryBurgundy,
      ),
      // Body text
      bodySmall: GoogleFonts.inter(
        fontSize: 16,
        color: AppColors.accentBrown,
      ),
      // Contact e-mail
      displaySmall: GoogleFonts.inter(
        color: AppColors.secondaryGreen,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      ));
}
