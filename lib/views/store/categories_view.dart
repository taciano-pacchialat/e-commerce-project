import 'package:e_commerce_project/services/store/category.dart';
import 'package:e_commerce_project/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_commerce_project/constants/app_colors.dart';

class CategoriesView extends StatelessWidget {
  final List<Category> categories = [
    Category(
        name: "Guitars", icon: const Icon(FontAwesomeIcons.guitar), items: 120),
    Category(
        name: "Audio",
        icon: const Icon(FontAwesomeIcons.headphones),
        items: 45),
    Category(
        name: "Amplifiers",
        icon: const Icon(FontAwesomeIcons.volumeHigh),
        items: 80),
    Category(
        name: "Effects Pedals",
        icon: const Icon(FontAwesomeIcons.sliders),
        items: 200),
    Category(
        name: "Accessories",
        icon: const Icon(FontAwesomeIcons.plane),
        items: 150),
  ];

  CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Categories',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              color: AppColors.primaryCream,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: AppColors.secondaryGold),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: AppColors.secondaryGreen,
                  child: Icon(Icons.category, color: AppColors.primaryCream),
                ),
                title: Text(
                  category.name,
                  style: const TextStyle(
                    color: AppColors.primaryBurgundy,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  '${category.items} items',
                  style: const TextStyle(
                    color: AppColors.primaryBurgundy,
                    fontSize: 14,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: AppColors.secondaryGold,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
