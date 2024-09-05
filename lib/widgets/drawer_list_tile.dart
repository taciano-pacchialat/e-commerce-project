import 'package:flutter/material.dart';
import 'package:frontend/constants/app_colors.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(
          left: 28.0,
          top: 8.0,
          bottom: 8.0,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w100,
            color: AppColors.primaryBurgundy,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
