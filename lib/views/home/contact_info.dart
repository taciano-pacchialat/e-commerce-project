import 'package:e_commerce_project/constants/app_colors.dart';
import 'package:flutter/material.dart';

// contact info class, used in the contact section
class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfo({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.accentBrown),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: AppColors.secondaryGreen)),
        ],
      ),
    );
  }
}
