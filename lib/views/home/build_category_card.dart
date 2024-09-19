import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

// Helper method for building category cards
Widget buildCategoryCard(IconData icon, String label) {
  return Card(
    color: AppColors.primaryCream,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: AppColors.secondaryGold),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: AppColors.accentBrown),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryBurgundy),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
